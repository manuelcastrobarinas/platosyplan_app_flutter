import 'package:platosyplan/models/auth/auth.dart';

abstract class AuthRules {
  Future<UserModel> login({required String email, required String password}); //Login of the users
  Future<UserModel> register({required String name, required String email, required String password,required String phone}); //register of the users
  Future<UserModel> getUserProfile();  //get user credentials if the token was saved in memory is valid
  Future<void>      logout(); //delete memory token
  Future<UserModel> updateUser({required String? name, required String? email, required String? password, required String? phone});
}