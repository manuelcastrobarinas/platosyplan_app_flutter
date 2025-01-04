import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:platosyplan/models/recipe.dart';
import 'package:platosyplan/services/services.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  
  final RecipeServices recipeService;
  RecipesBloc({required this.recipeService}) : super(RecipesState()) {
    //SET STATE TO GET ALL RECIPES
    on<OnGetAllRecipesEvent>                  ((event, emit) => emit((state).copyWith(allRecipes: event.newListRecipe)));
    on<OnCreateRecipeEvent>                   ((event, emit) => emit(state.copyWith()));
    on<OnGetMyRecipesEvent>                   ((event, emit) => emit(state.copyWith(myRecipes: event.myRecipes)));
    
    //SET STATE TO CREATE RECIPE
    on<OnSetCreateSelectedIngredientsEvent>     ((event, emit) => emit((state).copyWith(createdSelectedIngredients: event.createdSelectedIngredients)));
    on<OnSetCreateSelectedUtensilsEvent>        ((event, emit) => emit((state).copyWith(createdSelectedUtensils: event.createdSelectedUtensils)));
    on<OnSetCreateNameRecipeEvent>              ((event, emit) => emit((state).copyWith(nameRecipe: event.nameRecipe)));
    on<OnSetCreateDescriptionRecipeEvent>       ((event, emit) => emit((state).copyWith(descriptionRecipe: event.descriptionRecipe)));
    on<OnSetCreateCategoryRecipeEvent>          ((event, emit) => emit((state).copyWith(categoryRecipe: event.categoryRecipe)));
    on<OnSetCreateDifficultyRecipeEvent>        ((event, emit) => emit((state).copyWith(difficultyRecipe: event.difficultyRecipe)));
    on<OnSetCreateTimeCreateRecipeEvent>        ((event, emit) => emit((state).copyWith(timeCreateRecipe: event.timeCreateRecipe)));
    on<OnSetCreateNutricionalTableRecipeEvent>  ((event, emit) => emit((state).copyWith(nutricionalTable: event.nutricionalTable)));
    on<OnSetCreateStepsImagesRecipeEvent>       ((event, emit) => emit((state).copyWith(stepsImages: event.stepsImages)));
    on<OnSetCreateRecipeImageEvent>             ((event, emit) => emit((state).copyWith(recipeImage: event.recipeImage)));
    on<OnSetCreateStepsRecipeEvent>             ((event, emit) => emit((state).copyWith(createdStepsRecipe: event.createdStepsRecipe)));
    
    //SET STATE TO LOADING REQUEST
    on<OnChangeActiveRecipeEvent>               ((event, emit) => emit(state.copyWith()));

    //SET STATE TO LOADING REQUEST
    on<OnSetIsLoadingRequestEvent>              ((event, emit) => emit((state).copyWith(isLoadingRequest: event.isLoadingRequest)));
  }

  Future<void> getAllRecipes() async {
    final RecipeResponse response = await recipeService.getAllRecipes();
    add(OnGetAllRecipesEvent(newListRecipe: response.data!.recipes!));
  }

  Future<void> getMyRecipes() async {
    final RecipeResponse response = await recipeService.getMyRecipes();
    add(OnGetMyRecipesEvent(myRecipes: response.data!.recipes!));
  }

  Future<void> createRecipe() async {
    final RecipeModel recipe = RecipeModel(
      id          : 'asddsads',
      image       : '',
      name        : state.nameRecipe!,
      category    : state.categoryRecipe!,
      difficulty  : state.difficultyRecipe!,
      timeCreate  : state.timeCreateRecipe!.toInt(),
      description : state.descriptionRecipe!,
      active      : true,
      ingredients : state.createdSelectedIngredients,
      utensils    : state.createdSelectedUtensils,
      steps       : state.createdStepsRecipe,
      calification: 5,
      nutricionalTable: state.nutricionalTable,
    );

    //SET FINAL LIST IMAGES TO THE STEPS AND THE BANNER
    final List<File> allImages = <File>[state.recipeImage!, ...state.stepsImages ];

    await recipeService.createRecipe(recipe: recipe, allImages: allImages);
    add(OnCreateRecipeEvent());
  }

  //SET EVENTS TO CREATE RECIPE
  void addCreateSelectedIngredients(List<Ingredient> createdSelectedIngredients)  => add(OnSetCreateSelectedIngredientsEvent(createdSelectedIngredients: createdSelectedIngredients));
  void addCreateSelectedUtensils(List<Utensil> createdSelectedUtensils)           => add(OnSetCreateSelectedUtensilsEvent(createdSelectedUtensils: createdSelectedUtensils));
  void setCreateNameRecipe({required String nameRecipe})                          => add(OnSetCreateNameRecipeEvent(nameRecipe: nameRecipe));
  void setCreateDescriptionRecipe({required String descriptionRecipe})            => add(OnSetCreateDescriptionRecipeEvent(descriptionRecipe: descriptionRecipe));
  void setCreateCategoryRecipe({required String categoryRecipe})                  => add(OnSetCreateCategoryRecipeEvent(categoryRecipe: categoryRecipe));
  void setCreateDifficultyRecipe({required String difficultyRecipe})              => add(OnSetCreateDifficultyRecipeEvent(difficultyRecipe: difficultyRecipe));
  void setCreateTimeCreateRecipe({required double timeCreateRecipe})              => add(OnSetCreateTimeCreateRecipeEvent(timeCreateRecipe: timeCreateRecipe));
  void setCreateNutricionalTableRecipe(NutricionalTable nutricionalTable)         => add(OnSetCreateNutricionalTableRecipeEvent(nutricionalTable: nutricionalTable));
  void setCreateRecipeImage(File recipeImage)                                     => add(OnSetCreateRecipeImageEvent(recipeImage: recipeImage));
  void setCreateStepsImagesRecipe(List<File> stepsImages)                         => add(OnSetCreateStepsImagesRecipeEvent(stepsImages: stepsImages));
  void setCreateStepsRecipe(List<StepCooking> createdStepsRecipe)                 => add(OnSetCreateStepsRecipeEvent(createdStepsRecipe: createdStepsRecipe));
  
  //SET EVENTS TO LOADING REQUEST
  void setIsLoadingRequest(bool isLoadingRequest) => add(OnSetIsLoadingRequestEvent(isLoadingRequest: isLoadingRequest));

  //CHAGE RECIPE ACTIVATE
  Future<void> changeActiveRecipe({required bool isActive, required String recipeId}) async {
    await recipeService.changeActiveRecipe(isActive: isActive, recipeId: recipeId);

    // CREATE COPY TO THE RECIPES
    final updatedRecipes = List<RecipeModel>.from(state.myRecipes!);
    
    //SEARCH ID IN THE RECIPES CREATED
    final int index = updatedRecipes.indexWhere((RecipeModel recipe) => recipe.id == recipeId);
    //UPDATED RECIPE ACTIVATE, AND NOTIFIY TO THE STATE
    if (index != -1) {
      updatedRecipes[index].active = isActive; 
      add(OnChangeActiveRecipeEvent(myRecipesUpdated: updatedRecipes)); 
    }
  }
}