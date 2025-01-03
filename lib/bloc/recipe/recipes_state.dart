part of 'recipes_bloc.dart';


final class RecipesState {
  //GET ALL RECIPES
  final List<RecipeModel>? allRecipes;

  //CREATE RECIPE
  final String? nameRecipe;
  final String? categoryRecipe;
  final double? timeCreateRecipe;
  final String? difficultyRecipe;
  final String? descriptionRecipe;
  final List<Ingredient> createdSelectedIngredients;
  final NutricionalTable? nutricionalTable;
  final List<Utensil> createdSelectedUtensils;
  final File? recipeImage;
  final List<File> stepsImages;
  final List<StepCooking> createdStepsRecipe;

  //LOADING REQUEST
  bool isLoadingRequest;

  RecipesState({
    this.allRecipes = const [],
    this.nameRecipe,
    this.recipeImage,
    this.descriptionRecipe,
    this.categoryRecipe,
    this.difficultyRecipe,
    this.timeCreateRecipe,
    this.nutricionalTable,
    this.createdSelectedIngredients = const [],
    this.createdSelectedUtensils    = const [],
    this.stepsImages                = const [],
    this.createdStepsRecipe         = const [],
    this.isLoadingRequest           = false,
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
    List<Utensil>? createdSelectedUtensils,
    List<File>? stepsImages,
    List<StepCooking>? createdStepsRecipe,
    File? recipeImage,
    bool? isLoadingRequest,
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
    createdStepsRecipe: createdStepsRecipe ?? this.createdStepsRecipe,
    recipeImage: recipeImage ?? this.recipeImage,
    isLoadingRequest: isLoadingRequest ?? this.isLoadingRequest,
  );
}