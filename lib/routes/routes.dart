import 'package:flutter/material.dart';
import 'package:platosyplan/presentation/screens/navegation/navegation_screen.dart';
import 'package:platosyplan/presentation/views/views.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'introduction' : (_) => const IntroductionView(),
  'recipe'       : (_) => const RecipeView(),
  'cookingsteps' : (_) => const CookingStepsView(),
  'allrecets'    : (_) => const AllRecetsView(),
  'navegation'   : (_) => const NavegationScreen(),
  'login'        : (_) => const LoginView(),
  'register'     : (_) => const RegisterView(),
  'profile'      : (_) => const ProfileView(),
  'editprofile'  : (_) => const EditProfileView(),
  'myrecipes'    : (_) => const MyRecipesView(),
  'nameanddescription'  : (_) => const NameAndDescriptionView(),
  'selectimagerecipe'   : (_) => const TwoSelectImageView(),
  'timedifficulty' : (_) => const ThreeTimeDifficultyView(),
  'selectedingredients' : (_) => const FourSelectedIngredientsView(),
};