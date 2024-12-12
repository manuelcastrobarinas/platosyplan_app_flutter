import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platosyplan/models/auth/auth.dart';
import 'package:platosyplan/services/interfaces/auth_interface.dart';

import '../../errors/api_errors.dart';

class AuthService  implements AuthRules {

  final Dio _dio = Dio()
  ..options.connectTimeout = const Duration(seconds: 5)
  ..options.receiveTimeout = const Duration(seconds: 5)
  ..options.sendTimeout    = const Duration(seconds: 5);

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _backendUrl = dotenv.get('BACKEND_URL');
  
  bool isAuth = false;
  
  @override
  Future<UserModel> register({required String name, required String email, required String password, required String phone}) async { 
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
      await _saveToken(loginResponse.token);
      return loginResponse.userModel;
    } catch (e) {
      throw CustomApiErrors.fromError(e);
    }
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    try {
      final String url = '$_backendUrl/user/';
      final Map<String, String> data = <String, String> { 'email': email, 'password': password };
      final response = await _dio.post(url, data: data);

      final LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      final UserModel newUser = loginResponse.userModel;
      await _saveToken(loginResponse.token);
      return newUser;
    } catch (e) {
      throw CustomApiErrors.fromError(e);
    }
  }
  
  @override
  Future<UserModel> getUserProfile() async {
    try {
      final String url = '$_backendUrl/user/me';
      final String? token = await getToken(); 
      if (token == null) throw CustomApiErrors('No existe una sesión activa');
      
      final Response response = await _dio.get(url, options: Options( headers: {
          'Authorization': 'Bearer $token'
        }
      ));
      
      final LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      await _saveToken(loginResponse.token);
      return loginResponse.userModel;
    } catch (e) {
      logout();
      throw CustomApiErrors.fromError(e);
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
    await storage.delete(key: 'token');
  }
  
  @override
  Future<UserModel> updateUser({required String? name, required String? email, required String? password, required String? phone}) async {
    try { 
      final String? token = await getToken(); 
      final String url = '$_backendUrl/user/update';

      final Map<String, String> data = <String, String> {};
      if (name != null && name.trim().isNotEmpty)     data['name']  = name;
      if (email != null&& email.trim().isNotEmpty)    data['email'] = email;
      if (phone != null && phone.trim().isNotEmpty)    data['phone'] = phone;
      if (password != null && password.trim().isNotEmpty) data['password'] = password;

      final Response response = await _dio.patch(url, data: data, options: Options(headers: {
        'Authorization': 'Bearer $token'
      }));
      
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      throw CustomApiErrors.fromError(e);
    }
  }
}
