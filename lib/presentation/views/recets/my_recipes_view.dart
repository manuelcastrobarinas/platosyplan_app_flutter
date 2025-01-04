import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/recipe/recipes_bloc.dart';
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
      body: FutureBuilder(
        future  : BlocProvider.of<RecipesBloc>(context).getMyRecipes(), 
        builder : (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snapshot.connectionState == ConnectionState.none)    return const Center(child: Text("No hay conexión"));
          if (snapshot.hasError || snapshot.error == true)         return Center(child: Text(snapshot.error.toString()));
          return const MyRecipesScreen();
        }
      )
    );
  }
}