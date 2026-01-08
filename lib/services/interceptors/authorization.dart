import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:platosyplan/services/auth/auth.dart';

class AuthorizationInterceptor extends Interceptor {
  
  AuthorizationInterceptor();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {    
    final getToken = await AuthService.getToken();
    debugPrint("token del usuario $getToken");
    options.headers.addAll({
      'Authorization': 'Bearer $getToken'
    });

    super.onRequest(options, handler);
  }
}