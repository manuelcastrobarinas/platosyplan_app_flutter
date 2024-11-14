import 'package:flutter_svg/svg.dart';

class Steps {
  final SvgPicture imageUrl;
  final String description;
  final List<String> utensiliosStep;
  final List<Ingredients> ingredientesStep;

  const Steps({
    required this.imageUrl,
    required this.description,
    required this.utensiliosStep,
    required this.ingredientesStep
  });
}

class Ingredients {
  final String? image;
  final String name;
  final int units;

  const Ingredients({
    required this.name,
    required this.image,
    required this.units,
  });
}