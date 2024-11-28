part of 'recipes_bloc.dart';

@immutable
sealed class RecipesState {}

final class RecipesInitial extends RecipesState {
  final List<RecipeModel>? allRecipes;

  RecipesInitial({
    this.allRecipes = const [],
  });

  RecipesInitial copyWith({
    List<RecipeModel>? allRecipes,
  }) => RecipesInitial(
    allRecipes: allRecipes ?? this.allRecipes
  );
}
