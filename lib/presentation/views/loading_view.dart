import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/auth/auth_bloc.dart';
import 'package:platosyplan/presentation/screens/navegation/navegation_screen.dart';
import 'package:platosyplan/presentation/views/views.dart';
import '../screens/screens.dart';


class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: FutureBuilder(
        future  : BlocProvider.of<AuthBloc>(context).loadCredentials(), 
        builder : (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const LoadingScreen();
          if (snapshot.connectionState == ConnectionState.none)    return const Center(child: Text("No hay conexión"));
          if (snapshot.hasError || snapshot.error == true)         return Center(child: Text(snapshot.error.toString()));
          if (snapshot.data != 'success') return const LoginView();
          return const NavegationScreen();
        }
      ),
    );
  }
}