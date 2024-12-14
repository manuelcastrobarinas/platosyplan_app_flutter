import 'package:flutter/material.dart';
import '../../../screens/screens.dart';

class TwoSelectImageView extends StatelessWidget {
  const TwoSelectImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Receta', style: TextStyle(fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        )
      ),
      body: const TwoSelectImageScreen(),
    );
  }
}