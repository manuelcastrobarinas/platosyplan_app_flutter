import 'package:flutter/material.dart';
import 'package:platosyplan/presentation/screens/screens.dart';

class AllRecetsView extends StatelessWidget {
  const AllRecetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfff6f7fc),
      body: AllRecetsScreen(),
    );
  }
}