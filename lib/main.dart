import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/slidershow/slidershow_bloc.dart';
import 'package:platosyplan/routes/routes.dart';

void main() {
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider<SlidershowBloc>(create: (BuildContext context) => SlidershowBloc()),
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
        buttonTheme : const ButtonThemeData(
          buttonColor:  Color(0xffFF7622),
        ),
        useMaterial3: true,
      ),
      initialRoute: 'loading',
    );
  }
}