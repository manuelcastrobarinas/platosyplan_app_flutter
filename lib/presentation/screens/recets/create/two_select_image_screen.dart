import 'package:flutter/material.dart';

import '../../../../components/components.dart';

class TwoSelectImageScreen extends StatelessWidget {
  const TwoSelectImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<bool> stepsStatus = [true, true, false, false, false, false, false];
    
    return SizedBox(
      // color: Colors.grey[200],
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: TimelineVerticalComponent(stepsStatus: stepsStatus, heightToSpaceToNodes: size.height * 0.11),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 35.0),
                width : double.infinity,
                height: double.infinity,
                color : Colors.white,
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment : MainAxisAlignment.start,
                  children: [
                    const Text('Imagen', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 10.0),
                    const Text('Puedes seleccionar una imagen de tu galeria o tomar una foto con la camara del dispositivo con el fin de mostrar cual es la receta que estas creando y asi los demas usuarios puedan verla.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
                    const SizedBox(height: 10.0),
                    RichText(
                      text: const TextSpan(
                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black),
                      children: [
                        TextSpan(text: '- Puedes subir fotos en formato', style: TextStyle(fontWeight: FontWeight.w400)),
                        TextSpan(text: ' JPG, PNG etc.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900)),
                      ]
                    )),
                    RichText(
                      text: const TextSpan(
                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black),
                      children: [
                        TextSpan(text: '- Procura que la imagen sea', style: TextStyle(fontWeight: FontWeight.w400)),
                        TextSpan(text: ' horizontal.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900)),
                      ]
                    )),
                    const SizedBox(height: 30.0),
                    _SelectImage(
                      size: size, 
                      title: 'Selecciona una imagen'),
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        ButtonComponent(
                          minHeight : 45,
                          isLoading : false,
                          minWidth  : size.width * 0.45,
                          text      : 'Siguiente', 
                          function  : () => Navigator.pushNamed(context, 'timedifficulty'),
                        ),
                      ],
                    ),
                  ]
                )
              )
            )
          ]
        ),
      ),
    );
  }
}

class _SelectImage extends StatelessWidget {
  final String title; 
  
  const _SelectImage({
    required this.size, 
    required this.title,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height: size.height * 0.32,
      decoration: BoxDecoration(
        color : Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.image, size: 50.0, color: Colors.grey[400]),
            Text(title, style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black)),
            ButtonComponent(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              minHeight : 45,
              isLoading : false,
              minWidth  : size.width * 0.45,
              text      : 'Seleccionar imagen', 
              function  : () {} //TODO: ABRIR LA IMAGEN
            ),
             Column(
               children: [
                 RichText(
                  text: const TextSpan(
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black),
                  children: [
                    TextSpan(text: '- Puedes subir fotos en formato', style: TextStyle(fontWeight: FontWeight.w400)),
                    TextSpan(text: ' JPG, PNG etc.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
                  ]
                )),
                RichText(
                  text: const TextSpan(
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black),
                  children: [
                    TextSpan(text: '- Procura que la imagen sea', style: TextStyle(fontWeight: FontWeight.w400)),
                    TextSpan(text: ' horizontal.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
                  ]
                )),
               ],
             ),
          ],
        ),
      ),
    );
  }
}