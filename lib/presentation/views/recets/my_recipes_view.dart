import 'package:flutter/material.dart';
import 'package:platosyplan/presentation/screens/recets/my_recipes_screen.dart';

class MyRecipesView extends StatelessWidget {
  const MyRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme : const IconThemeData(color: Colors.black),
        leading   : IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title     : const Text('Mis Recetas', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: const MyRecipesScreen()
    );
  }
}