import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/slidershow/slidershow_bloc.dart';
import 'package:platosyplan/bloc/steps/steps_bloc.dart';
import 'package:platosyplan/routes/routes.dart';

void main() {
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider<SlidershowBloc>(create: (BuildContext context) => SlidershowBloc()),
      BlocProvider<StepsBloc>     (create: (BuildContext context) => StepsBloc(slideshowBloc: context.read<SlidershowBloc>() )), //INYECCION DE UN BLOC EN OTRO
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'platosyplan',
      routes: routes,
      theme : ThemeData(
        colorScheme : ColorScheme.fromSeed(seedColor: const Color(0xffFF7622)),
        primaryColor: const Color(0xffFF7622),
        secondaryHeaderColor: const Color(0xffffb872),
        primaryColorLight: const Color(0xffffebe4),
        scaffoldBackgroundColor: Colors.white,
        buttonTheme : const ButtonThemeData(
          buttonColor:  Color(0xffFF7622),
        ),
        useMaterial3: true,
      ),
      initialRoute: 'loading',
    );
  }
}