import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/recipe/recipes_bloc.dart';
import 'package:platosyplan/components/components.dart';
import 'package:platosyplan/models/recipe.dart';

import '../../../components/alerts/show_alert_for_request_component.dart';
import '../../../components/alerts/show_scaffold_message_component.dart';

class MyRecipesScreen extends StatelessWidget {
  const MyRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        physics   : const BouncingScrollPhysics(),
        controller: scrollController,
        child : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child  : SizedBox(
            width : double.infinity,
            child : BlocBuilder<RecipesBloc, RecipesState>(
              builder : (BuildContext context, RecipesState state) {
                final List<RecipeModel> myRecipes = state.myRecipes!;
                return Column(
                  mainAxisAlignment : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    ButtonComponent(
                      minWidth  : size.width * 0.85, 
                      minHeight : 50, 
                      function  : () => Navigator.pushNamed<Object?>(context, 'nameanddescription'), 
                      text      : 'Crear Receta', 
                      isLoading : false
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding :  const EdgeInsets.symmetric(horizontal: 15.0),
                      child   : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('recetas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('${myRecipes.length} creadas', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                    _ListOfRecipesCreated(scrollController: scrollController, myRecipes: myRecipes),
                    const SizedBox(height: 30),
                  ]
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ListOfRecipesCreated extends StatelessWidget {
  final List<RecipeModel> myRecipes;

  const _ListOfRecipesCreated({
    required this.scrollController,
    required this.myRecipes
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller  : scrollController,
      shrinkWrap  : true,
      itemCount   : myRecipes.length,
      separatorBuilder: (context, index) => const Divider(height: 10, color: Colors.black12),
      itemBuilder : (context, index) =>  ListTile(
        dense   : true,
        title   : Text(myRecipes[index].name, style: const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis), maxLines: 1),
        subtitle: Text(myRecipes[index].description , style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis), maxLines: 1),
        leading : SizedBox(
          height  : 45,
          width   : 45,
          child   : FadeInImage(
            fit     : BoxFit.cover,
            placeholder:  const AssetImage("assets/food/loading-food.gif"), 
            image:  NetworkImage(myRecipes[index].image),
            imageErrorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 30),
          ),
        ),
        trailing : Switch(
          activeTrackColor    : Theme.of(context).primaryColor,
          activeColor         : Theme.of(context).primaryColorLight,
          inactiveTrackColor  : Theme.of(context).primaryColorLight,
          inactiveThumbColor  : Theme.of(context).primaryColor,
          value               : myRecipes[index].active, 
          onChanged: (bool isActiveRecipe) async {
            showDialog(
              context: context, 
              builder: (_) => ShowAlertForRequestComponent(
                informationAlert: 'estas apunto de ${isActiveRecipe  ? 'activar' : 'desactivar'} esta receta. ¿Estas segur@ que deseas desactivar esta receta?',
                title           : '${isActiveRecipe  ? 'activar' : 'desactivar'} Receta',
                cancelText      : isActiveRecipe  ? 'No activar' : 'No desactivar',                  
                buttonAccept    : TextButton(
                  onPressed : () async {
                    Navigator.of(context).pop();
                    try {                   
                      _showDialogToUpdate(context: context);
                      await BlocProvider.of<RecipesBloc>(context).changeActiveRecipe(isActive: isActiveRecipe, recipeId: myRecipes[index].id);
                      if(!context.mounted) return;         
                      Navigator.of(context).pop();
                    } catch (e) {
                      Navigator.of(context).pop();
                      showScaffoldMessageComponent(context: context, message: e.toString());
                    }
                  }, 
                  child : const Text('Si estoy segur@')
                ),
              ),
            );
          } 
        ),
      ),
    );
  }
}

_showDialogToUpdate({required BuildContext context}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text("Actualizando..."),
        ],
      ),
    ),
  );
}