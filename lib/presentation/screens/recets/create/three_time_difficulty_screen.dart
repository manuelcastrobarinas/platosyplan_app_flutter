import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/components/alerts/show_scaffold_message_component.dart';
import '../../../../bloc/recipe/recipes_bloc.dart';
import '../../../../components/components.dart';

class ThreeTimeDifficultyScreen extends StatelessWidget {
  const ThreeTimeDifficultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<bool> stepsStatus = [true, true, true, false, false, false, false];

    final List<String> categories = ['FACIL', 'MEDIA', 'AVANZADO'];
    final RecipesBloc recipesBloc = BlocProvider.of<RecipesBloc>(context);

    final TextEditingController timeCreateRecipeController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return SizedBox(
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
              child: SingleChildScrollView(
                child: BlocBuilder<RecipesBloc, RecipesState>(
                  builder: (context, state) {
                    return Form(
                      key: formKey,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 35.0),
                        width : double.infinity,
                        color : Colors.white,
                        child : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment : MainAxisAlignment.start,
                          children: [
                            const Text('Tiempo de cocción', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                            const SizedBox(height: 10.0),
                            const Text('A continuación, ingresa el tiempo de cocción en minutos, esto con el fin de que los usuarios puedan conocer el tiempo de preparación de la receta de manera anticipada y precisa.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
                            const SizedBox(height: 30.0),
                            TextformfieldComponent(
                              icon        : Icons.timer_outlined,
                              controller  : timeCreateRecipeController,
                              keyboardType: TextInputType.number,
                              label       : state.timeCreateRecipe == null ? 'Tiempo de cocción' : state.timeCreateRecipe.toString(),
                              suffixText  : "minutos",
                              onChanged   : (String time) => recipesBloc.setCreateTimeCreateRecipe(timeCreateRecipe: double.parse(time)),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              padding   : const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Dificultad', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                                  const SizedBox(height: 10.0),
                                  const Text('Selecciona cual es el nivel de dificultad que tiene la receta para ser preparada.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify), 
                                  const SizedBox(height: 10.0),
                                  CategorySelectorComponent(
                                    categories: categories, 
                                    iconMapper: _getCategoryIcon,
                                    onSelected: (String newValue) => recipesBloc.setCreateDifficultyRecipe(difficultyRecipe: newValue),
                                  ),
                                ],
                              ),
                            ),  
                            const SizedBox(height: 140.0),
                            Row(
                              children: [
                                const Expanded(child: SizedBox()),
                                ButtonComponent(
                                  minHeight : 45,
                                  isLoading : false,
                                  minWidth  : size.width * 0.45,
                                  text      : 'Siguiente', 
                                  function  : () {
                                    if(_validateAllSteps(formKey: formKey, context: context, category: recipesBloc.state.difficultyRecipe, timeCreateRecipe: state.timeCreateRecipe)) {
                                      Navigator.pushNamed(context, 'selectedingredients');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ]
                        )
                      ),
                    );
                  },
                ),
              ),
            )
          ]
        ),
      ),
    );
  }


  bool _validateAllSteps({required GlobalKey<FormState> formKey, required BuildContext context, required String? category, required double? timeCreateRecipe}) {
    if (timeCreateRecipe == null) {
      
      if (!(formKey.currentState?.validate() ?? false)) return false;

      if (timeCreateRecipe!.isNegative) {
        showScaffoldMessageComponent(context: context, message: 'El tiempo de cocción no puede ser negativo');
        // ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('El tiempo de cocción no puede ser negativo')));
        return false;
      }

    }

    if (category == null || category.isEmpty) {
      showScaffoldMessageComponent(context: context, message: 'Debes seleccionar una categoría');
      // ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Debes seleccionar una categoría')));
      return false;
    }

    return true;
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toUpperCase()) {
      case 'FACIL':
        return Icons.restaurant;
      case 'MEDIA':
        return Icons.table_restaurant_outlined;
      case 'AVANZADO':
        return Icons.eco;
      default:
        return Icons.restaurant_menu;
    }
  }
}