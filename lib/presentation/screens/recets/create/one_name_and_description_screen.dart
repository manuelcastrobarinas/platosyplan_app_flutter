import 'package:flutter/material.dart';
import '../../../../components/components.dart';

class NameAndDescriptionScreen extends StatelessWidget {
  const NameAndDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<bool> stepsStatus = [true, false, false, false, false, false, false];
    final List<String> categories = <String>  [
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
    
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
                child: TimelineVerticalComponent(stepsStatus: stepsStatus, heightToSpaceToNodes: size.height * 0.11),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 35.0),
                  width : double.infinity,
                  height: double.infinity,
                  color : Colors.white,
                  child : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment : MainAxisAlignment.start,
                    children: [
                      const Text('Nombre y descripción', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 10.0),
                      const Text('Escribe el nombre del producto y su respectiva descripción. Recuerda que la redaccion debe ser clara y concisa. ademas debes tener en cuenta la ortografia y gramatica.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
                      const SizedBox(height: 30.0),
                      TextformfieldComponent(
                        icon: Icons.title,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.text,
                        label: "Titulo del producto",
                        suffixText: "titulo",
                      ),
                      const SizedBox(height: 30.0),
                      TextformfieldComponent(
                        controller: TextEditingController(),
                        keyboardType: TextInputType.text,
                        label: "descripción del producto",
                        suffixText: "describe",              
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Categoría', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                            const SizedBox(height: 10.0),
                            const Text('Selecciona la categoría a la que pertenece de la receta para que sea mas facil encontrarla por los demas usuarios.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify), 
                            const SizedBox(height: 10.0),
                            CategorySelectorComponent(categories: categories, iconMapper: _getCategoryIcon),
                          ],
                        ),
                      ),         
                      const SizedBox(height: 50.0),
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          ButtonComponent(
                            minHeight : 45,
                            isLoading : false,
                            minWidth  : size.width * 0.45,
                            text      : 'Siguiente', 
                            function  : () => Navigator.pushNamed(context, 'selectimagerecipe'),
                          ),
                        ],
                      ),
                    ]
                  )
                )
              )
            ]
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

  // time_create
  // difficulty
  
  
  // ingredients
  // nutricional_table
  // utensils
  // steps