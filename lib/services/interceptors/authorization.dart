import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:platosyplan/services/auth/auth.dart';

class AuthorizationInterceptor extends Interceptor {
  
  AuthorizationInterceptor();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {    
    final geToken = await AuthService.getToken();
    debugPrint("token del usuario $geToken");
    options.headers.addAll({
      'Authorization': 'Bearer $geToken'
    });

    super.onRequest(options, handler);
  }
}