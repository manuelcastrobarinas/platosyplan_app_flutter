import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:platosyplan/models/recipe.dart';
import '../../errors/api_errors.dart';

class RecipeServices {

  final Dio _dio = Dio();
  final String _url = dotenv.get("BACKEND_URL"); 
  RecipeResponse? recipeResponse;
  
  Future<String> getAllRecipes() async {
    try {
      final String url = '$_url/recipes/all';
      final Response<dynamic> response = await _dio.get(url);
      recipeResponse = RecipeResponse.fromJson(response.data);
      return 'success';
    } catch (e) {
      return throw CustomApiErrors.fromError(e);
    }
  }
}