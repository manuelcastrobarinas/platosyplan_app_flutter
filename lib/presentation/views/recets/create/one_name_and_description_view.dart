import 'package:flutter/material.dart';
import 'package:platosyplan/presentation/screens/recets/create/one_name_and_description_screen.dart';

class NameAndDescriptionView extends StatelessWidget {
  const NameAndDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Crear Receta', style: TextStyle(fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: const NameAndDescriptionScreen()
    );
  }
}