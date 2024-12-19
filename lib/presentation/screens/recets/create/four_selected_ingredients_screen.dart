import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/models/recipe.dart';

import '../../../../bloc/recipe/recipes_bloc.dart';
import '../../../../components/components.dart';
import '../../../../utils/ingredients/ingredients.dart';


class FourSelectedIngredientsScreen extends StatefulWidget {
  const FourSelectedIngredientsScreen({super.key});

  @override
  State<FourSelectedIngredientsScreen> createState() => _FourSelectedIngredientsScreenState();
}

class _FourSelectedIngredientsScreenState extends State<FourSelectedIngredientsScreen> {
  late final TextEditingController _ingredientController;
  late final TextEditingController _quantityController;

  bool get _isFormValid => _ingredientController.text.isEmpty || _quantityController.text.isEmpty;
  bool _mounted = true;

  @override
  void initState() {
    super.initState();
    _ingredientController = TextEditingController();
    _quantityController   = TextEditingController();
    
    _ingredientController.addListener(_onTextChanged);
    _quantityController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (_mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _mounted = false;
    _ingredientController.removeListener(_onTextChanged);
    _quantityController.removeListener(_onTextChanged);
    
    _ingredientController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final List<bool> stepsStatus = [true, true, true, true, false, false, false];

    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (BuildContext context, RecipesState state) {
        List<Ingredient> selectedIngredients = state.createdSelectedIngredients;
        return SizedBox(
          width: size.width,
          child: KeyboardListener(
            focusNode : FocusNode(),
            onKeyEvent: (_) {},
            child: Padding(
              padding : const EdgeInsets.symmetric(horizontal: 30.0),
              child   : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children : <Widget> [
                  SizedBox(
                    width: 60,
                    child: TimelineVerticalComponent(stepsStatus: stepsStatus, heightToSpaceToNodes: size.height * 0.11),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding : const EdgeInsets.symmetric(vertical: 35.0),
                        width   : double.infinity,
                        child   : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding   : const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Ingredientes', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                                  const SizedBox(height: 10.0),
                                  const Text('Agrega los ingredientes que usaste para crear tu receta. Puedes buscarlo por nombre o agregar uno nuevo si no lo encuentras. Recuerda que los ingredientes deben ser claros y concisos.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
                                  const SizedBox(height: 10.0),
                                  Autocomplete<String>(
                                    optionsBuilder: (TextEditingValue textEditingValue) {
                                      if (textEditingValue.text.isEmpty) return const Iterable<String>.empty();
                                      return ingredientes.where((String option) => option.toLowerCase().contains(textEditingValue.text.toLowerCase())).toList();
                                    },
                                    onSelected: (String selection) {
                                      if (_mounted) {
                                        setState(() {
                                          _ingredientController.text = selection;
                                        });
                                      }
                                    },
                                    fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        if (textEditingController.text != _ingredientController.text) {
                                          textEditingController.text = _ingredientController.text;
                                        }
                                      });
                                      
                                      return TextformfieldComponent(
                                        icon: Icons.add_circle_outline_rounded,
                                        controller: _ingredientController,
                                        focusNode: focusNode,
                                        keyboardType: TextInputType.text,
                                        label: "nuevo ingrediente",
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                  TextformfieldComponent(
                                    icon: Icons.numbers,
                                    controller: _quantityController,
                                    keyboardType: TextInputType.number,
                                    label: "cantidad",
                                  ),
                                  const SizedBox(height: 10.0),
                                  ButtonComponent(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    minHeight : 45,
                                    isLoading : false,
                                    minWidth  : double.infinity,
                                    text      : 'Agregar ingrediente',
                                    function  : _isFormValid ? null : () {
                                      if (_ingredientController.text.isNotEmpty && _quantityController.text.isNotEmpty) {
                                        final bool ingredientExists = _validateIngredientExists(selectedIngredients, _ingredientController.text);
                                       
                                        if (ingredientExists) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar( content: const Text('Este ingrediente ya fue agregado'),backgroundColor: Theme.of(context).secondaryHeaderColor));
                                          return;
                                        }

                                        final newIngredients = List<Ingredient>.from(selectedIngredients)..add( //agregar ingrediente
                                          Ingredient(
                                            name  : _ingredientController.text,
                                            image : getIngredientImage(_ingredientController.text),
                                            units : double.parse(_quantityController.text),
                                          ),
                                        );

                                        BlocProvider.of<RecipesBloc>(context).addCreateSelectedIngredients(newIngredients);
                                        
                                        setState(() {
                                          _ingredientController.clear();
                                          _quantityController.clear();
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Divider(color: Colors.grey.shade300,),
                            const SizedBox(height: 10.0), 
                            Text('Ingredientes Seleccionados (${selectedIngredients.length})', style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                            const SizedBox(height: 10.0),
                            (selectedIngredients.isEmpty) 
                            ? ListTile(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300),),
                                subtitle: const Text('No tienes ingredientes seleccionados. tienes que agregar ingredientes para crear tu receta.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),textAlign: TextAlign.justify),
                                trailing: const SizedBox(),
                              ) 
                            : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: selectedIngredients.length,
                              itemBuilder: (context, index) {
                                final ingredient = selectedIngredients[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: ListTile(
                                    shape   : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300)),
                                    leading : ( ingredient.image != null) ? Image.network(
                                      ingredient.image!,
                                      scale : 1.0, 
                                      width : 30, 
                                      height: 30, 
                                      fit   : BoxFit.cover,
                                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) => const Icon(Icons.image_not_supported, size: 30)
                                    ) : const Icon(Icons.image_not_supported, size: 30),
                                    title   : Text(ingredient.name),
                                    subtitle: Text('Cantidad: ${ingredient.units}'),
                                    trailing: IconButton(
                                      icon:  Icon(Icons.delete, color: Theme.of(context).primaryColor),
                                      onPressed: () { //eliminar ingrediente
                                        final newIngredients = List<Ingredient>.from(selectedIngredients)..removeAt(index);
                                        BlocProvider.of<RecipesBloc>(context).addCreateSelectedIngredients(newIngredients);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),                      
                            const SizedBox(height: 40.0),
                            Row(
                              children: [
                                const Expanded(child: SizedBox()),
                                ButtonComponent(
                                  minHeight: 45,
                                  isLoading: false,
                                  minWidth: size.width * 0.45,
                                  text: 'Siguiente',
                                  function: selectedIngredients.isEmpty ? null : () {
                                    if (_mounted) {
                                      Navigator.pushNamed(context, 'selectingutensils');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

bool _validateIngredientExists(List<Ingredient> selectedIngredients, String ingredientName) {
  final bool ingredientExists = selectedIngredients.any((ingredient) => ingredient.name.toLowerCase() == ingredientName.toLowerCase());
  return ingredientExists;
}
