import 'dart:io';
import '../../models/recipe.dart';

abstract class RecipeContract {
  Future<RecipeResponse>  getAllRecipes();
  Future<RecipeResponse>  createRecipe({required RecipeModel recipe, required List<File> allImages});
}