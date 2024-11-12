import 'package:flutter/material.dart';
import 'package:platosyplan/presentation/views/views.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'loading' : (_) => const LoadingView(),
  'recipe'  : (_) => const RecipeView(),
  'cookingsteps'  : (_) => const CookingStepsView(),
};