import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/recipe/recipes_bloc.dart';
import '../../../../components/components.dart';
import '../../../../models/recipe.dart';

class SixNutritionalTableScreen extends StatefulWidget {
  const SixNutritionalTableScreen({super.key});

  @override
  State<SixNutritionalTableScreen> createState() => _SixNutritionalTableScreenState();
}

class _SixNutritionalTableScreenState extends State<SixNutritionalTableScreen> {
 @override
  Widget build(BuildContext context) {
    final TextEditingController caloriesController      = TextEditingController();
    final TextEditingController fatController           = TextEditingController();
    final TextEditingController saturedFatController    = TextEditingController();
    final TextEditingController carbohidratesController = TextEditingController();
    final TextEditingController sugarController         = TextEditingController();
    final TextEditingController dietaryFiberController  = TextEditingController();
    final TextEditingController proteinController       = TextEditingController();
    final TextEditingController cholesterolController   = TextEditingController();
    final TextEditingController sodiumController        = TextEditingController();

    final Size size = MediaQuery.of(context).size;
    final List<bool> stepsStatus = [true, true, true, true, true, true, false];

    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: TimelineVerticalComponent(
                stepsStatus: stepsStatus, 
                heightToSpaceToNodes: size.height * 0.11
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<RecipesBloc, RecipesState>(
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 35.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  const Text('Tabla nutricional', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                                  const SizedBox(height: 10.0),
                                  const Text('En esta seccion debes agregar los datos nutricionales de tu receta: Ejemplo: 100 calorias, 10 gramos de grasas, 5 gramos de carbohidratos, etc.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'calorias',  medida: 'gramos', controller: caloriesController),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'grasas',    medida: 'gramos', controller: fatController),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'grasas saturadas', medida: 'gramos', controller: saturedFatController),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'carbohidratos', medida: 'gramos', controller: carbohidratesController),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'azucar', medida: 'gramos', controller: sugarController),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'fibra dietetica', medida: 'gramos', controller: dietaryFiberController),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'proteina', medida: 'gramos', controller: proteinController),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'colesterol', medida: 'miligramos', controller: cholesterolController),
                                  const SizedBox(height: 10.0),
                                  _NutritionalTableElement(title: 'sodio', medida: 'miligramos', controller: sodiumController),
                                  const SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              ButtonComponent(
                                minHeight: 45,
                                isLoading: false,
                                minWidth: size.width * 0.45,
                                text: 'Siguiente',
                                function: () {
                                  final recipeBloc = context.read<RecipesBloc>();
                                  if(caloriesController.text.isEmpty && fatController.text.isEmpty && saturedFatController.text.isEmpty && carbohidratesController.text.isEmpty && sugarController.text.isEmpty && dietaryFiberController.text.isEmpty && proteinController.text.isEmpty && cholesterolController.text.isEmpty && sodiumController.text.isEmpty){
                                    Navigator.pushNamed(context, 'sevencreatesteps');
                                  }
                                  recipeBloc.setCreateNutricionalTableRecipe(
                                    NutricionalTable(
                                      calories      : NutritionalTableElement(name: 'calorias', amount: caloriesController.text.isEmpty ? 0 : int.parse(caloriesController.text)),
                                      fat           : NutritionalTableElement(name: 'grasas', amount: fatController.text.isEmpty ? 0 : int.parse(fatController.text)),
                                      saturedFat    : NutritionalTableElement(name: 'grasas saturadas', amount: saturedFatController.text.isEmpty ? 0 : int.parse(saturedFatController.text)),
                                      carbohidrate  : NutritionalTableElement(name: 'carbohidratos', amount: carbohidratesController.text.isEmpty ? 0 : int.parse(carbohidratesController.text)),
                                      sugar         : NutritionalTableElement(name: 'azucar', amount: sugarController.text.isEmpty ? 0 : int.parse(sugarController.text)),
                                      dietaryFiber  : NutritionalTableElement(name: 'fibra dietetica', amount: dietaryFiberController.text.isEmpty ? 0 : int.parse(dietaryFiberController.text)),
                                      protein       : NutritionalTableElement(name: 'proteina', amount: proteinController.text.isEmpty ? 0 : int.parse(proteinController.text)),
                                      cholesterol   : NutritionalTableElement(name: 'colesterol', amount: cholesterolController.text.isEmpty ? 0 : int.parse(cholesterolController.text)),
                                      sodium        : NutritionalTableElement(name: 'sodio', amount: sodiumController.text.isEmpty ? 0 : int.parse(sodiumController.text)),
                                    ) 
                                  );
                                  Navigator.pushNamed(context, 'sevencreatesteps');
                                } 
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NutritionalTableElement extends StatelessWidget {
  final String title;
  final String medida;
  final TextEditingController controller;

  const _NutritionalTableElement({ required this.title, required this.medida, required this.controller });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300)),
      title : TextFormField (
        controller  : controller,
        keyboardType: TextInputType.number,
        decoration  : InputDecoration(
          border: InputBorder.none,
          label : Text(title, style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400)),
        ),
      ),
      trailing: Text(medida),
    );
  }
}