import 'package:flutter/material.dart';
import '../screens/screens.dart';

class CookingStepsView extends StatelessWidget {
  const CookingStepsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CookingStepsScreen(),
    );
  }
}