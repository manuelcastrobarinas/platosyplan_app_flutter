import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/steps/steps_bloc.dart';
import '../screens/screens.dart';

class CookingStepsView extends StatelessWidget {
  const CookingStepsView({super.key});

  @override
  Widget build(BuildContext context) {
    final StepsBloc stepsBloc = BlocProvider.of<StepsBloc>(context);
    return Scaffold(
      body: FutureBuilder(
        future  : stepsBloc.getCookingSteps(),
        builder : (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snapshot.connectionState == ConnectionState.none)    return const Center(child: Text('Error al revisar la ruta'));
          return const CookingStepsScreen();
        },
      ),
    );
  }
}