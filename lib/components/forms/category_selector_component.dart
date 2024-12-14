import 'package:flutter/material.dart';

class CategorySelectorComponent extends StatefulWidget {
  const CategorySelectorComponent({super.key});

  @override
  State<CategorySelectorComponent> createState() => _CategorySelectorComponentState();
}

class _CategorySelectorComponentState extends State<CategorySelectorComponent> {
  final List<String> categories = [
    'Mariscos',
    'Comida Rápida',
    'Vegetariana',
    'Postres',
    'Sopas',
    'Carnes',
    'Ensaladas',
    'Desayunos',
    'Bebidas',
    'Pasta',
    'Parrilladas',
    'Mexicana',
    'Italiana',
    'Asiática',
    'Masas',
    'Aderezos',
    'Saludable',
    'Snacks',
    'Típicos',
    'Fusión',
  ];

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: PopupMenuButton<String>(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Colors.black12)),
        initialValue: selectedCategory,
        onSelected: (String newValue) => setState(() => selectedCategory = newValue),
        itemBuilder: (BuildContext context) {
          return categories.map((String category) {
            return PopupMenuItem<String>(
              value: category,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(_getCategoryIcon(category), size: 20, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 10),
                    Text(category),
                  ],
                ),
              ),
            );
          }).toList();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: <Widget>[
              if (selectedCategory != null) ...<Widget>[
                Icon(_getCategoryIcon(selectedCategory!), size: 20, color: Theme.of(context).primaryColor),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(selectedCategory ?? 'Selecciona una categoría', style: TextStyle(color: selectedCategory == null ? Colors.grey.shade600 : Colors.black)),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'mariscos':
        return Icons.set_meal;
      case 'comida rápida':
        return Icons.fastfood;
      case 'vegetariana':
        return Icons.eco;
      case 'postres':
        return Icons.cake;
      case 'sopas':
        return Icons.soup_kitchen;
      case 'carnes':
        return Icons.restaurant;
      case 'ensaladas':
        return Icons.local_dining;
      case 'desayunos':
        return Icons.free_breakfast;
      case 'bebidas':
        return Icons.local_drink;
      case 'pasta':
        return Icons.dinner_dining;
      case 'parrilladas':
        return Icons.outdoor_grill;
      case 'mexicana':
        return Icons.local_pizza;
      case 'italiana':
        return Icons.local_pizza;
      case 'asiática':
        return Icons.ramen_dining;
      case 'masas':
        return Icons.bakery_dining;
      case 'aderezos':
        return Icons.water_drop;
      case 'saludable':
        return Icons.spa;
      case 'snacks':
        return Icons.lunch_dining;
      case 'típicos':
        return Icons.food_bank;
      case 'fusión':
        return Icons.restaurant_menu;
      default:
        return Icons.restaurant_menu;
    }
  }
}