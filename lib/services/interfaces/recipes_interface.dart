import 'dart:io';
import '../../models/recipe.dart';

abstract class RecipeContract {
  Future<RecipeResponse>  getAllRecipes();
  Future<RecipeResponse>  createRecipe({required RecipeModel recipe, required List<File> allImages});
  Future<RecipeResponse>  getMyRecipes();
  Future<void>  changeActiveRecipe({required bool isActive, required String recipeId});
}