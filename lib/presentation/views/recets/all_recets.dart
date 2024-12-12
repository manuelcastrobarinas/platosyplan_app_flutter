import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/recipe/recipes_bloc.dart';
import 'package:platosyplan/presentation/screens/screens.dart';
import '../../../components/components.dart';

class AllRecetsView extends StatelessWidget {
  const AllRecetsView({super.key});

  @override
  Widget build(BuildContext context) {
    final  RecipesBloc recipeBloc = BlocProvider.of<RecipesBloc>(context);
    return Scaffold(
      drawer: const DrawerPersonal(),
      backgroundColor: const Color(0xfff6f7fc),
      body: FutureBuilder(
        future  : recipeBloc.getAllRecipes(), 
        builder : (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snapshot.connectionState == ConnectionState.none)    return const Center(child: Text("No hay conexión"));
          if (snapshot.hasError || snapshot.error == true)         return Center(child: Text(snapshot.error.toString()));
          return  const AllRecetsScreen();
        }
      )
    );
  }
}