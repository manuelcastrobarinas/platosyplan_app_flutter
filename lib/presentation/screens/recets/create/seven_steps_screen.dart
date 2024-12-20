import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/recipe/recipes_bloc.dart';
import '../../../../components/components.dart';
import '../../../../models/recipe.dart';

class SevenStepsScreen extends StatefulWidget {
  const SevenStepsScreen({super.key});

  @override
  State<SevenStepsScreen> createState() => _SevenStepsScreenState();
}

class _SevenStepsScreenState extends State<SevenStepsScreen> {

  void addNewStep() {
    setState(() {
      steps.add(StepCooking(image: '', description: '', utensiliosSteps: [], ingredientsSteps: []));
      imagesSteps.add(File(''));
    });
  }

  final List<StepCooking> steps = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<File> imagesSteps = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<bool> timelineStepsStatus = [true, true, true, true, true, true, true];

    return Scaffold(
      appBar: AppBar(
        title   : const Text('Crear Receta', style: TextStyle(fontWeight: FontWeight.w600)),
        leading : IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        )
      ),
      floatingActionButton: Padding(
        padding : const EdgeInsets.only(left: 30.0),
        child   : Align(
          alignment : Alignment.bottomLeft,
          child     : FloatingActionButton(
            shape     : const CircleBorder(),
            onPressed : () => addNewStep(),
            child     : Icon(Icons.add_to_photos_rounded, color: Theme.of(context).primaryColor, size: 24),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SizedBox(
      width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TimeLine(stepsStatus: timelineStepsStatus, size: size),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 35.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          const _TitleAndDescriptionSectionSteps(),
                          const SizedBox(height: 20.0),
                          ...List.generate(steps.length, (int index) => _buildStepCard(index: index)),
                          const SizedBox(height: 20.0),
                          BlocBuilder<RecipesBloc, RecipesState>(
                            builder: (context, state) {
                              return Row(
                                children: <Widget> [
                                  const Expanded(child: SizedBox()),
                                  ButtonComponent(
                                    minHeight : 45,
                                    isLoading : state.isLoadingRequest,
                                    minWidth  : size.width * 0.45,
                                    text      : 'Crear receta',
                                    function  : () {
                                      //VALDATE STEPS DATA
                                      if (!_validateAllSteps()) return;

                                      for (var image in imagesSteps) {
                                        debugPrint('ESTAS ES LA IMAGEN  EN LA POSICION ${imagesSteps.indexOf(image)}:  ${image.path}');
                                      }
                                      
                                      //SEND DATA TO BLOC
                                      final RecipesBloc recipesBloc = BlocProvider.of<RecipesBloc>(context);
                                      try {
                                        recipesBloc.setIsLoadingRequest(true);
                                        recipesBloc.setCreateStepsRecipe(steps);
                                        recipesBloc.setCreateStepsImagesRecipe(imagesSteps);
                                      } catch (e) {
                                        debugPrint('Error al enviar los datos al bloc: $e');
                                      } finally {
                                        recipesBloc.setIsLoadingRequest(false);
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

    

  Widget _buildStepCard({required int index}) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        margin  : const EdgeInsets.only(bottom: 15),
        padding : const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Paso ${index + 1}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                IconButton(
                  onPressed : () => _showDeleteConfirmationDialog(index),
                  icon      : const Icon(Icons.delete, color: Colors.red),
                  tooltip   : 'Eliminar paso',
                ),
              ],
            ),

            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 10),
            const Text('Descripción', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text('Agrega la descripcion del paso para que los usuarios puedan conocer el proceso de la receta.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
            const SizedBox(height: 10),
            Container(
              color: Colors.transparent,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: 10,
                minLines: 1,
                validator: (value) => (value == null || value.isEmpty) 
                  ? 'La descripción no puede estar vacía' 
                  : null,
                onChanged: (value) {
                  setState(() {
                    steps[index].description = value;
                    if (kDebugMode) {
                      print("esta es la descripcion del paso ${index + 1} ${steps[index].description}");
                    }
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripción del paso',
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
            ),
            
            const SizedBox(height: 10.0),
            const Text('Imagen', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10.0),
            const Text('Agrega la imagen del paso para que los usuarios tengan una mejor visualización del proceso.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
            const SizedBox(height: 10.0),
            _SelectImage(
              size  : size, 
              title : 'Selecciona una imagen',
              onImageSelected: (File image) {
                setState(() {
                  imagesSteps[index] = image;
                  debugPrint('ESTAS ES LA IMAGEN  EN LA POSICION ${imagesSteps.indexOf(image)}:  ${image.path}');
                });
              },
            ),
            const SizedBox(height: 10.0),
            const Text('Utensilios', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10.0),
            const Text('Agrega los utensilios necesarios para el paso.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
            const SizedBox(height: 10.0),
            _SelectUtensils(
              stepIndex : index,
              allSteps  : steps,
              onUtensilsSelected: (List<Utensil> selectedUtensils) { // Dentro de esta función, se actualiza el estado del paso actual (steps[index]) creando un nuevo objeto StepCooking con los utensilios seleccionados y manteniendo el resto de las propiedades del paso actual.
                setState(() {
                  steps[index] = StepCooking(
                    image : steps[index].image,
                    description: steps[index].description,
                    utensiliosSteps: selectedUtensils,
                    ingredientsSteps: steps[index].ingredientsSteps,
                  );
                });
              },
            ),
            const SizedBox(height: 10.0),
            const Text('Ingredientes', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10.0),
            const Text('Selecciona los ingredientes necesarios para este paso.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
            const SizedBox(height: 10.0),
            _SelectIngredients(
              stepIndex : index,
              allSteps  : steps,
              onIngredientsSelected: (List<Ingredient> selectedIngredients) {
                setState(() {
                  steps[index] = StepCooking(
                    image: steps[index].image,
                    description: steps[index].description,
                    utensiliosSteps: steps[index].utensiliosSteps,
                    ingredientsSteps: selectedIngredients,
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }


  bool _validateAllSteps() {
    // Validar el formulario
    if (!(_formKey.currentState?.validate() ?? false)) return false;
    
    // Validar que haya al menos un paso
    if (steps.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes agregar al menos un paso'))
      );
      return false;
    }

     for (int i = 0; i < imagesSteps.length; i++) {
      if (imagesSteps[i].path.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falta la imagen del paso ${i + 1}'))
        );
        return false;
      }
    }

    // Obtener todos los utensilios disponibles
    final state = context.read<RecipesBloc>().state;
    final allUtensils = state.createdSelectedUtensils.toSet();
    
    // Obtener todos los utensilios seleccionados en todos los pasos
    final selectedUtensils = <String>{};
    for (var step in steps) {
      if (step.utensiliosSteps != null) {
        selectedUtensils.addAll(
          step.utensiliosSteps!.map((u) => u.name ?? '').where((name) => name.isNotEmpty)
        );
      }
    }

    // Verificar si hay utensilios sin seleccionar
    final unselectedUtensils = allUtensils.difference(selectedUtensils);
    if (unselectedUtensils.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Faltan utensilios por seleccionar: ${unselectedUtensils.join(", ")}'))
      );
      return false;
    }

    // Validar ingredientes
    final allIngredients = state.createdSelectedIngredients;
    final selectedIngredients = <String>{};
    
    for (var step in steps) {
      if (step.ingredientsSteps != null) {
        selectedIngredients.addAll(
          step.ingredientsSteps!.map((i) => i.name).where((name) => name.isNotEmpty)
        );
      }
    }

    final unselectedIngredients = allIngredients
      .where((ingredient) => !selectedIngredients.contains(ingredient.name))
      .map((i) => i.name)
      .toList();

    if (unselectedIngredients.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Faltan ingredientes por seleccionar: ${unselectedIngredients.join(", ")}'))
      );
      return false;
    }

    return true;
  }

  Future<void> _showDeleteConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: const Text('¿Seguro que quieres eliminar este paso?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Sí', style: TextStyle(color: Colors.red)),
              onPressed: () {
                setState(() {
                  steps.removeAt(index);
                  imagesSteps.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}

class _TitleAndDescriptionSectionSteps extends StatelessWidget {
  const _TitleAndDescriptionSectionSteps();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
            Text('Pasos de la receta', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
            SizedBox(height: 10.0),
            Text('En esta seccion debes agregar los pasos de la receta, cada paso debe tener una imagen, una descripcion, los utensilios e ingredientes de dicho paso.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
            SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class _TimeLine extends StatelessWidget {
  const _TimeLine({
    required this.stepsStatus,
    required this.size,
  });

  final List<bool> stepsStatus;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TimelineVerticalComponent(
        stepsStatus: stepsStatus, 
        heightToSpaceToNodes: size.height * 0.11
      ),
    );
  }
}

class _SelectUtensils extends StatelessWidget {

  final int stepIndex;
  final List<StepCooking> allSteps;
  final Function(List<Utensil>) onUtensilsSelected;

  const _SelectUtensils({
    required this.stepIndex,
    required this.allSteps,
    required this.onUtensilsSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        // Obtener todos los utensilios disponibles
        final allUtensils = state.createdSelectedUtensils.map((name) => Utensil(name: name)).toList();
        
        // Obtener utensilios ya seleccionados en otros pasos
        final usedUtensils = <String>{};
        for (var i = 0; i < allSteps.length; i++) {
          if (i != stepIndex && allSteps[i].utensiliosSteps != null) {
            usedUtensils.addAll(
              allSteps[i].utensiliosSteps!.map((u) => u.name ?? '').where((name) => name.isNotEmpty)
            );
          }
        }

        // Filtrar utensilios disponibles
        final availableUtensils = allUtensils.where(
          (utensil) => !usedUtensils.contains(utensil.name)
        ).toList();

        // Obtener utensilios seleccionados en este paso
        final selectedUtensils = allSteps[stepIndex].utensiliosSteps ?? [];

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: availableUtensils.map((utensil) {
                    final isSelected = selectedUtensils.any((u) => u.name == utensil.name);
                    return FilterChip(
                      selected: isSelected,
                      label: Text(utensil.name ?? ''),
                      onSelected: (selected) {
                        List<Utensil> newSelection;
                        (selected) ? newSelection = [...selectedUtensils, utensil] : newSelection = selectedUtensils.where((u) => u.name != utensil.name).toList();
                        onUtensilsSelected(newSelection);
                      },
                    );
                  }).toList(),
                ),
                if (availableUtensils.isEmpty) ...[
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'No hay utensilios disponibles',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SelectImage extends StatelessWidget {
  final String title; 
  final Function(File image) onImageSelected;

  const _SelectImage({
    required this.size, 
    required this.title,
    required this.onImageSelected,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height: size.height * 0.32,
      decoration: BoxDecoration(
        color : Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: SelectImageComponent(  
        size: size, 
        title: title,
        onImageSelected: (File image) {
          onImageSelected(image);
        },
      ),
    );
  }
}

class _SelectIngredients extends StatelessWidget {
  final int stepIndex;
  final List<StepCooking> allSteps;
  final Function(List<Ingredient>) onIngredientsSelected;

  const _SelectIngredients({
    required this.stepIndex,
    required this.allSteps,
    required this.onIngredientsSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        // Obtener todos los ingredientes disponibles
        final allIngredients = state.createdSelectedIngredients;
        
        // Obtener ingredientes ya seleccionados en otros pasos
        final usedIngredients = <String>{};
        
        for (var i = 0; i < allSteps.length; i++) {
          if (i != stepIndex && allSteps[i].ingredientsSteps != null) {
            usedIngredients.addAll(
              allSteps[i].ingredientsSteps!.map((i) => i.name).where((name) => name.isNotEmpty)
            );
          }
        }

        // Filtrar ingredientes disponibles
        final availableIngredients = allIngredients.where((ingredient) => !usedIngredients.contains(ingredient.name)).toList();
        // Obtener ingredientes seleccionados en este paso
        final selectedIngredients = allSteps[stepIndex].ingredientsSteps ?? [];

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (availableIngredients.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('No hay ingredientes disponibles', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ),
                )
              else
                ...availableIngredients.map((ingredient) {
                  final isSelected = selectedIngredients.any((i) => i.name == ingredient.name);
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: CheckboxListTile(
                      dense       : true,
                      checkColor  : Colors.white,
                      activeColor : Theme.of(context).secondaryHeaderColor,
                      value       : isSelected,
                      title       : Text(ingredient.name, style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600,  overflow: TextOverflow.ellipsis), maxLines: 2),
                      secondary   : ingredient.image != null && ingredient.image!.isNotEmpty
                        ? Image.network(
                            ingredient.image!,
                            width : 35,
                            height: 35,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) =>  const Icon(Icons.image_not_supported, size: 35)
                          )
                        : const Icon(Icons.image_not_supported, size: 35),  
                      onChanged: (bool? value) {
                        (value == true) 
                          ? onIngredientsSelected([...selectedIngredients, ingredient]) 
                          : onIngredientsSelected(selectedIngredients.where((i) => i.name != ingredient.name).toList());
                      },
                    ),
                  );
                }),
            ],
          ),
        );
      },
    );
  }
}