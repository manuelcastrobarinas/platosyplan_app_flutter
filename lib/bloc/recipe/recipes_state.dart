part of 'recipes_bloc.dart';


final class RecipesState {
  final List<RecipeModel>? allRecipes;

  final String? nameRecipe;
  final String? categoryRecipe;
  final double? timeCreateRecipe;
  final String? difficultyRecipe;
  final String? descriptionRecipe;
  final List<Ingredient> createdSelectedIngredients;
  final NutricionalTable? nutricionalTable;
  final List<String> createdSelectedUtensils;
  final File? recipeImage;
  final List<File> stepsImages;

  RecipesState({
    this.allRecipes = const [],
    this.nameRecipe,
    this.descriptionRecipe,
    this.categoryRecipe,
    this.difficultyRecipe,
    this.timeCreateRecipe,
    this.nutricionalTable,
    this.createdSelectedIngredients = const [],
    this.createdSelectedUtensils    = const [],
    this.stepsImages                = const [],
    this.recipeImage,
  });

  RecipesState copyWith({
    List<RecipeModel>? allRecipes,
    String? nameRecipe,
    String? descriptionRecipe,
    String? categoryRecipe,
    String? difficultyRecipe,
    double? timeCreateRecipe,
    NutricionalTable? nutricionalTable,
    List<Ingredient>? createdSelectedIngredients,
    List<String>? createdSelectedUtensils,
    List<File>? stepsImages,
    File? recipeImage,
  }) => RecipesState(
    allRecipes: allRecipes ?? this.allRecipes,
    nameRecipe: nameRecipe ?? this.nameRecipe,
    descriptionRecipe: descriptionRecipe ?? this.descriptionRecipe,
    categoryRecipe: categoryRecipe ?? this.categoryRecipe,
    difficultyRecipe: difficultyRecipe ?? this.difficultyRecipe,
    timeCreateRecipe: timeCreateRecipe ?? this.timeCreateRecipe,
    nutricionalTable: nutricionalTable ?? this.nutricionalTable,
    createdSelectedIngredients: createdSelectedIngredients ?? this.createdSelectedIngredients,
    createdSelectedUtensils: createdSelectedUtensils ?? this.createdSelectedUtensils,
    stepsImages: stepsImages ?? this.stepsImages,
    recipeImage: recipeImage ?? this.recipeImage,
  );
}