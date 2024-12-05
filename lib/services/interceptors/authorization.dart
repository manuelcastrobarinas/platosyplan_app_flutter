import 'package:dio/dio.dart';
import 'package:platosyplan/services/auth/auth.dart';

class AuthorizationInterceptor extends Interceptor {
  
  AuthorizationInterceptor();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {    
    options.headers.addAll({
      'Authorization': 'Bearer ${AuthService.getToken()}'
    });

    super.onRequest(options, handler);
  }
}