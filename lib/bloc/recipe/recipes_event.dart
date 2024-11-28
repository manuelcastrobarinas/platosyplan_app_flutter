part of 'recipes_bloc.dart';

@immutable
sealed class RecipesEvent {}

class OnGetAllRecipesEvent extends RecipesEvent{
  final List<RecipeModel> newListRecipe;
  OnGetAllRecipesEvent({required this.newListRecipe});
}
