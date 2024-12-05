
abstract class AuthRules {
  Future<String> login({required String email, required String password}); //Login of the users
  Future<String> register({required String name, required String email, required String password,required String phone}); //register of the users
  Future<String> getUserCredentials();  //get user credentials if the token was saved in memory is valid
  Future<void>   logout(); //delete memory token
}