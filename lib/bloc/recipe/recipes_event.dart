part of 'recipes_bloc.dart';

@immutable
sealed class RecipesEvent {}

class OnGetAllRecipesEvent extends RecipesEvent{
  final List<RecipeModel> newListRecipe;
  OnGetAllRecipesEvent({required this.newListRecipe});
}

class OnSetCreateSelectedIngredientsEvent extends RecipesEvent{
  final List<Ingredient> createdSelectedIngredients;
  OnSetCreateSelectedIngredientsEvent({required this.createdSelectedIngredients});
}

class OnSetCreateSelectedUtensilsEvent extends RecipesEvent{
  final List<String> createdSelectedUtensils;
  OnSetCreateSelectedUtensilsEvent({required this.createdSelectedUtensils});
}

class OnSetCreateNameRecipeEvent extends RecipesEvent{
  final String nameRecipe;
  OnSetCreateNameRecipeEvent({required this.nameRecipe});
}

class OnSetCreateDescriptionRecipeEvent extends RecipesEvent{
  final String descriptionRecipe;
  OnSetCreateDescriptionRecipeEvent({required this.descriptionRecipe});
}

class OnSetCreateCategoryRecipeEvent extends RecipesEvent{
  final String categoryRecipe;
  OnSetCreateCategoryRecipeEvent({required this.categoryRecipe});
}

class OnSetCreateDifficultyRecipeEvent extends RecipesEvent{
  final String difficultyRecipe;
  OnSetCreateDifficultyRecipeEvent({required this.difficultyRecipe});
}

class OnSetCreateTimeCreateRecipeEvent extends RecipesEvent{
  final double timeCreateRecipe;
  OnSetCreateTimeCreateRecipeEvent({required this.timeCreateRecipe});
}

class OnSetCreateNutricionalTableRecipeEvent extends RecipesEvent{
  final NutricionalTable nutricionalTable;
  OnSetCreateNutricionalTableRecipeEvent({required this.nutricionalTable});
}
