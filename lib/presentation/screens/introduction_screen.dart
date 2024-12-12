import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platosyplan/components/alerts/show_alert_component.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../components/components.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      Image.asset('assets/fondo.png'),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SlideshowComponent(
                          context: context,
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
                  child: ButtonComponent(
                    isLoading : state.isLoadingRequest,
                    minWidth  : MediaQuery.of(context).size.width * 0.55,
                    minHeight : 50,
                    function  : () async {
                      final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
                      authBloc.setIsLoadingRequest(isLoadingRequest: true);
                      
                      try {
                         await authBloc.loadCredentials();
                          if (!context.mounted) return;
                          Navigator.pushReplacementNamed(context, 'navegation');
                          return; 
                      } catch (e) {
                        if (!context.mounted) return;
                        showDialog(
                          context: context, 
                          builder: (_) => ShowAlertComponent(title: 'Error inesperado', subtitle: e.toString()),
                        );
                        Navigator.pushNamed(context, 'login');
                      } finally {
                        authBloc.setIsLoadingRequest(isLoadingRequest: false);
                      }
                    },
                    text: "Siguiente"
                  )
                ),
            ],
          );
        },
      ),
    );
  }
}
