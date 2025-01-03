import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import '../../../../bloc/recipe/recipes_bloc.dart';
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
                    SelectImageComponent(
                      size: size, 
                      title: 'Selecciona una imagen',
                      onImageSelected: (File image) {
                        BlocProvider.of<RecipesBloc>(context).setCreateRecipeImage(image);
                      }
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        BlocBuilder<RecipesBloc, RecipesState>(
                          builder: (context, state) {
                            return ButtonComponent(
                              minHeight : 45,
                              isLoading : false,
                              minWidth  : size.width * 0.45,
                              text      : 'Siguiente', 
                              function  : (state.recipeImage != null) ? () => Navigator.pushNamed(context, 'timedifficulty') : null,
                            );
                          },
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