import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:platosyplan/models/recipe.dart';
import '../../errors/api_errors.dart';

class RecipeServices {

  final Dio _dio = Dio();
  final String _url = dotenv.get("BACKEND_URL"); 

  Future<RecipeResponse> getAllRecipes() async {
    try {
      final String url = '$_url/recipes/all';
      final Response<dynamic> response = await _dio.get(url);
      final RecipeResponse recipeResponse = RecipeResponse.fromJson(response.data);
      return recipeResponse;
    } catch (e) {
      throw CustomApiErrors.fromError(e);
    }
  }
}