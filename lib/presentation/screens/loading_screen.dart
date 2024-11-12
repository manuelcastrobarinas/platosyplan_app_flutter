import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/components.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Image.asset('assets/fondo.png'),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SlideshowComponent(
                    bulletPrimary   : 18.0,
                    bulletSecondary : 10.0,
                    primaryColor    : Theme.of(context).primaryColor,     
                    slides: <Widget>[
                      SvgPicture.asset('assets/svgs/slide-1.svg'),
                      SvgPicture.asset('assets/svgs/slide-2.svg'),
                      SvgPicture.asset('assets/svgs/slide-3.svg'),
                      SvgPicture.asset('assets/svgs/slide-4.svg'),
                      SvgPicture.asset('assets/svgs/slide-5.svg'),
                    ]  
                  ),
                ),
              ],
            )
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  Text('Come mejor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), maxLines: 2),
                  Text('¡cada dia!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), maxLines: 2),
                  SizedBox(height: 10.0),
                  Text('Recibe ingredientes frescos y las mejores recetas directamente en tu puerta', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center, maxLines: 2)
                ],
              ),
            )
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: MaterialButton(
                minWidth  : MediaQuery.of(context).size.width * 0.55,
                elevation : 0,
                height: 50,
                color : Theme.of(context).primaryColor,
                shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: () => Navigator.pushNamed(context, 'recipe'),
                child : const Text('Siguiente', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 17), maxLines: 1),
              ),
            )
          ),
        ],
      ),
    );
  }
}
