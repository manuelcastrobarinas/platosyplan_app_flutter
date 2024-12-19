import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:platosyplan/models/recipe.dart';
import 'package:platosyplan/services/services.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  
  final RecipeServices recipeService;
  RecipesBloc({required this.recipeService}) : super(RecipesState()) {
      on<OnGetAllRecipesEvent>                  ((event, emit) => emit((state).copyWith(allRecipes: event.newListRecipe)));
      on<OnSetCreateSelectedIngredientsEvent>   ((event, emit) => emit((state).copyWith(createdSelectedIngredients: event.createdSelectedIngredients)));
      on<OnSetCreateSelectedUtensilsEvent>      ((event, emit) => emit((state).copyWith(createdSelectedUtensils: event.createdSelectedUtensils)));
      on<OnSetCreateNameRecipeEvent>            ((event, emit) => emit((state).copyWith(nameRecipe: event.nameRecipe)));
      on<OnSetCreateDescriptionRecipeEvent>     ((event, emit) => emit((state).copyWith(descriptionRecipe: event.descriptionRecipe)));
      on<OnSetCreateCategoryRecipeEvent>        ((event, emit) => emit((state).copyWith(categoryRecipe: event.categoryRecipe)));
      on<OnSetCreateDifficultyRecipeEvent>      ((event, emit) => emit((state).copyWith(difficultyRecipe: event.difficultyRecipe)));
      on<OnSetCreateTimeCreateRecipeEvent>      ((event, emit) => emit((state).copyWith(timeCreateRecipe: event.timeCreateRecipe)));
      on<OnSetCreateNutricionalTableRecipeEvent>((event, emit) => emit((state).copyWith(nutricionalTable: event.nutricionalTable)));
  }

  Future<void> getAllRecipes() async {
    final RecipeResponse response = await recipeService.getAllRecipes();
    add(OnGetAllRecipesEvent(newListRecipe: response.data!.recipes!));
  }

  void addCreateSelectedIngredients(List<Ingredient> createdSelectedIngredients) => add(OnSetCreateSelectedIngredientsEvent(createdSelectedIngredients: createdSelectedIngredients));
  void addCreateSelectedUtensils(List<String> createdSelectedUtensils) => add(OnSetCreateSelectedUtensilsEvent(createdSelectedUtensils: createdSelectedUtensils));
  void setCreateNameRecipe({required String nameRecipe}) => add(OnSetCreateNameRecipeEvent(nameRecipe: nameRecipe));
  void setCreateDescriptionRecipe({required String descriptionRecipe}) => add(OnSetCreateDescriptionRecipeEvent(descriptionRecipe: descriptionRecipe));
  void setCreateCategoryRecipe({required String categoryRecipe}) => add(OnSetCreateCategoryRecipeEvent(categoryRecipe: categoryRecipe));
  void setCreateDifficultyRecipe({required String difficultyRecipe}) => add(OnSetCreateDifficultyRecipeEvent(difficultyRecipe: difficultyRecipe));
  void setCreateTimeCreateRecipe({required double timeCreateRecipe}) => add(OnSetCreateTimeCreateRecipeEvent(timeCreateRecipe: timeCreateRecipe));
  void setCreateNutricionalTableRecipe(NutricionalTable nutricionalTable) => add(OnSetCreateNutricionalTableRecipeEvent(nutricionalTable: nutricionalTable));
}