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

class OnSetCreateRecipeImageEvent extends RecipesEvent{
  final File recipeImage;
  OnSetCreateRecipeImageEvent({required this.recipeImage});
}

class OnSetCreateStepsImagesRecipeEvent extends RecipesEvent{
  final List<File> stepsImages;
  OnSetCreateStepsImagesRecipeEvent({required this.stepsImages});
}

class OnSetCreateStepsRecipeEvent extends RecipesEvent{
  final List<StepCooking> createdStepsRecipe;
  OnSetCreateStepsRecipeEvent({required this.createdStepsRecipe});
}

class OnSetIsLoadingRequestEvent extends RecipesEvent{
  final bool isLoadingRequest;
  OnSetIsLoadingRequestEvent({required this.isLoadingRequest});
}
