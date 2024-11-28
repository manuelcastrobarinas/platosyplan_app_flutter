import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:platosyplan/models/recipe.dart';
import 'package:platosyplan/services/services.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  
  final RecipeServices recipeService;
  RecipesBloc({required this.recipeService}) : super(RecipesInitial()) {
    if (state is RecipesInitial) {
      on<OnGetAllRecipesEvent>((event, emit) => emit((state as RecipesInitial).copyWith(allRecipes: event.newListRecipe)));
    }
  }

  Future<String> getAllRecipes() async {
    final String response = await recipeService.getAllRecipes();
    if (response != 'success') return response;
    add(OnGetAllRecipesEvent(newListRecipe: recipeService.recipeResponse!.data!.recipes!));
    return response;
  }
}
