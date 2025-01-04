import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:platosyplan/models/recipe.dart';
import '../../errors/api_errors.dart';
import '../interceptors/authorization.dart';
import '../interfaces/recipes_interface.dart';

class RecipeServices implements RecipeContract {

  final Dio _dio = Dio()
    ..interceptors.add(AuthorizationInterceptor());

  final String _url = dotenv.get("BACKEND_URL"); 

  @override
  Future<RecipeResponse> getAllRecipes() async {
    try {
      final String url = '$_url/recipes/all';
      final Dio dio = Dio();
      final Response<dynamic> response = await dio.get(url);
      final RecipeResponse recipeResponse = RecipeResponse.fromJson(response.data);
      return recipeResponse;
    } catch (e) {
      throw CustomApiErrors.fromError(e);
    }
  }

  @override
  Future<RecipeResponse> createRecipe({required RecipeModel recipe, required List<File> allImages}) async {
    try {
      final String url = '$_url/recipes/create';

      final formData = FormData.fromMap({...recipe.toJson(), 'images': allImages.map((file) => MultipartFile.fromFileSync(file.path)).toList() });
      final Response<dynamic> response = await _dio.post(url, data: formData);

      final RecipeResponse recipeResponse = RecipeResponse.fromJson(response.data);
      return recipeResponse;
    } catch (e) {
      throw CustomApiErrors.fromError(e);
    }
  }
  
  @override
  Future<RecipeResponse> getMyRecipes() async {
    try {
      final String url = '$_url/recipes/myrecipes';
      final Response<dynamic> response = await _dio.get(url);
      final RecipeResponse recipeResponse = RecipeResponse.fromJson(response.data);
      return recipeResponse;
    } catch (e) {
      throw CustomApiErrors.fromError(e);
    }
  }

  @override
  Future<void> changeActiveRecipe({required bool isActive, required String recipeId}) async {
    try {
      final String url = '$_url/recipes/active';
      await _dio.patch(url, data: {'active': isActive, 'recipe_id': recipeId}); 
    } catch (e) {
      throw CustomApiErrors.fromError(e);
    }
  }

}