import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platosyplan/models/auth/auth.dart';
import 'package:platosyplan/services/interfaces/auth_interface.dart';

import '../../errors/api_errors.dart';

class AuthService  implements AuthRules {

  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _backendUrl = dotenv.get('BACKEND_URL');
  
  bool isAuth = false;
  UserModel? user;
  
  @override
  Future<String> register({required String name, required String email, required String password,required String phone}) async { 
    try {
      final Map<String, String> data = <String, String> {
        'name'    : name,
        'email'   : email,
        'password': password,
        'phone'   : '57$phone'
      };

      final respose = await _dio.post('$_backendUrl/user/create', data: data, options: Options(
        headers: {'content-Type': 'application/json'}
      ));

      final LoginResponse loginResponse = LoginResponse.fromJson(respose.data);
      user = loginResponse.userModel;
      await _saveToken(loginResponse.token);
      return 'success';
    } catch (e) {
      return throw CustomApiErrors.fromError(e);
    }
  }

  @override
  Future<String> login({required String email, required String password}) async {
    try {
      final String url = '$_backendUrl/user/';
      final Map<String, String> data = <String, String> { 'email': email, 'password': password };
      final response = await _dio.post(url, data: data);

      final LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      user = loginResponse.userModel;
      await _saveToken(loginResponse.token);
      return 'success';
    } catch (e) {
      return throw CustomApiErrors.fromError(e);
    }
  }
  
  @override
  Future<String> getUserCredentials() async {
    try {
      final String url = '$_backendUrl/user/me';
      final String? token = await getToken(); 
      if (token == null) return 'no existe una sesion activa';
      final Response response = await _dio.get(url, options: Options( headers: {
          'Authorization': 'Bearer $token'
        }
      ));
      final LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      user = loginResponse.userModel;
      await _saveToken(loginResponse.token);
      return 'success';
    } catch (e) {
      logout();
      return throw CustomApiErrors.fromError(e);
    }
  }
  
  Future<void> _saveToken(String token) async => await _storage.write(key: 'token', value: token);

  @override
  Future<void> logout() async => await _storage.delete(key: 'token');
  
  static Future<String?> getToken() async { //for use in other methods
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
    return token; 
  }

  static Future<void> deleteToken() async { //for delete the sesion
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.delete(key: 'key');
  }

  //TODO: SACAR LA PANTALLA DE CARGANDO Y HACER LA PETICION DE LAS CREDENCIALES EN EL BOTON DELA PANTALLA DE INTRODUCCION
}
