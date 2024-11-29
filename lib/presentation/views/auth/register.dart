import 'package:flutter/material.dart';
import 'package:platosyplan/components/components.dart';
import '../../screens/screens.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Stack(
            children: [
              HeaderCurve(),
              RegisterScreen()
            ],  
          ),
        ),
      ),
    );
  }
}