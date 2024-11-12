import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/slidershow/slidershow_bloc.dart';

class SlideshowComponent extends StatelessWidget {

  final List<Widget> slides;
  final bool   dotsUp;
  final Color  primaryColor;
  final Color  secondaryColor;
  final double bulletPrimary;
  final double bulletSecondary;

  const SlideshowComponent({
    super.key, 
    required this.slides,
    this.dotsUp          = false,
    this.primaryColor    = Colors.blue,
    this.secondaryColor  = Colors.grey,
    this.bulletPrimary   = 12.0,
    this.bulletSecondary = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final SlidershowBloc slidershow = BlocProvider.of<SlidershowBloc>(context);
    return BlocBuilder<SlidershowBloc, SlidershowState>(
      builder: (context, state) {
        slidershow.changePrimaryColor(newPrimaryColor: primaryColor);
        slidershow.changeSecondaryColor(newSecondaryColor: secondaryColor);
        slidershow.changeBulletPrimary(newbulletPrimary: bulletPrimary);
        slidershow.changeBulletSecondary(newbulletSecondary: bulletSecondary);            
        return SafeArea(
          child: Center(
            child: _CreateSlideshowStructure(
              dotsUp: dotsUp, 
              slides: slides,
              currentPage: state.currentPage,
            )
          )
        );
      },
    );
  }
}

class _CreateSlideshowStructure extends StatelessWidget {
  final bool dotsUp;
  final List<Widget> slides;
  final double currentPage; 
  
  const _CreateSlideshowStructure({
    required this.dotsUp,
    required this.slides,
    required this.currentPage
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        (dotsUp) 
          ? _Dots(totalSlides: slides.length, currentPage: currentPage)
          : Expanded(
            child: _Slides(slides)
          ),
        (!dotsUp) ? _Dots(totalSlides: slides.length, currentPage: currentPage) : const SizedBox()
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final double currentPage;
  
  const _Dots({
    required this.totalSlides,
    required this.currentPage
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate( totalSlides, (i) => _Dot(index: i, currentPage: currentPage)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final double currentPage;

  const _Dot({
    required this.index,
    required this.currentPage
  });

  @override
  Widget build(BuildContext context) {
    final SlidershowState slidershowBloc = BlocProvider.of<SlidershowBloc>(context).state;
    double size;
    Color color;

    if (currentPage >= index - 0.5 && currentPage < index + 0.5) { 
      size  = slidershowBloc.bulletPrimary;
      color = slidershowBloc.primaryColor;
    } else {
      size  = slidershowBloc.bulletSecondary;
      color = slidershowBloc.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final PageController pageViewController = PageController();

  @override
  void initState() { 
    super.initState();
    pageViewController.addListener(() {
      //LLamamos al metodo para cambiar el current page dentro del initState
      context.read<SlidershowBloc>().changeCurrentPage(newCurrentPage: pageViewController.page!);
    });
  }

  @override
  void dispose() { 
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      physics: const BouncingScrollPhysics(),
      children: widget.slides.map( (slide) => _Slide( slide ) ).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.all(30),
      width : double.infinity,
      height: double.infinity,
      child : slide
    );
  }
}