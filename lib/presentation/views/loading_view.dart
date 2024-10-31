import 'package:flutter/material.dart';
import 'package:platosyplan/presentation/screens/screens.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingScreen(),
    );
  }
}