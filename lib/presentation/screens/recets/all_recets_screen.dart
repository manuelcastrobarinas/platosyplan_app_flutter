import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/models/recipe.dart';

import '../../../bloc/recipe/recipes_bloc.dart';

class AllRecetsScreen extends StatelessWidget {
  const AllRecetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    const TextStyle titleStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 20, overflow: TextOverflow.ellipsis);
    const TextStyle sectionTitleStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 16, overflow: TextOverflow.ellipsis);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller : controller,
      child: ConstrainedBox(
        constraints:  BoxConstraints(minHeight: size.height),
        child: BlocBuilder<RecipesBloc, RecipesState>(
          builder: (context, state) {
              return (state.allRecipes!.isEmpty) ? const Center(child: Text("no hay recetas creadas"))
               : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Header(size: size, titleStyle: titleStyle),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 22.0),
                    child: Text("Todos los platos disponibles", style: titleStyle),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(0.0),
                    itemCount   : state.allRecipes!.length,
                    shrinkWrap  : true,
                    controller  : controller,
                    itemBuilder : (BuildContext context, int i) {
                      final RecipeModel recipe = state.allRecipes![i];
                      return Padding(
                        padding : const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        child : GestureDetector(
                          onTap: () => Navigator.pushNamed(context, 'recipe', arguments: recipe),
                          child: _RecipesCards(recipe: recipe, sectionTitleStyle: sectionTitleStyle),
                        ),
                      );
                    }
                  )
                ],
              );
          },
        ),
      ),
    );
  }
}

class _RecipesCards extends StatelessWidget {
  const _RecipesCards({
    required this.recipe,
    required this.sectionTitleStyle,
  });

  final RecipeModel recipe;
  final TextStyle sectionTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color : Colors.white,
      elevation: 0,
      child : SizedBox(
        height: 350,
        width : double.infinity,
        child : Padding(
          padding : const EdgeInsets.all(15.0),
          child   : SizedBox(
            height: double.infinity,
            width : double.infinity,
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex  : 1,
                  child : _ImageTitleAndDescriptionRecipeCard(recipe: recipe, sectionTitleStyle: sectionTitleStyle)
                ),
                Expanded(
                  flex  : 4,
                  child : Container(
                    width : double.infinity,
                    height: double.infinity,
                    decoration : const BoxDecoration(
                      color : Color(0xfff6f7fc),
                      borderRadius: BorderRadius.only(
                        topLeft : Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),    
                    child: Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                            child: FadeInImage(
                              fit: BoxFit.fitWidth,
                              placeholder: const AssetImage("assets/food/loading-food.gif"), 
                              image: NetworkImage(recipe.image),
                              height: double.infinity,
                              width : double.infinity,
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex  : 1,
                  child : Container(
                    height : 50,
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15.0))
                    ),
                    child: Center(child: _StadisticsRecipe(recipe: recipe)),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class _ImageTitleAndDescriptionRecipeCard extends StatelessWidget {
  const _ImageTitleAndDescriptionRecipeCard({
    required this.recipe,
    required this.sectionTitleStyle,
  });

  final RecipeModel recipe;
  final TextStyle sectionTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment : MainAxisAlignment.start,
      children: [
        Hero(
          tag: recipe.id,
          child: ClipOval(
            child: FadeInImage(
              placeholder: const AssetImage("assets/food/loading-food-two.gif"),
              image: NetworkImage(recipe.image),
              fit: BoxFit.cover,
              width: 50, // Debe coincidir con el diámetro del círculo (2 * radius)
              height: 50,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment : MainAxisAlignment.start,
            children: [
              Text(recipe.name, style: sectionTitleStyle),
              Text(recipe.description, style: const TextStyle(color: Colors.black38, fontSize: 14, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.size,
    required this.titleStyle,
  });

  final Size size;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width : double.infinity,
      height: size.height * 0.15,
      child : SafeArea(
        child : Align(
          alignment: Alignment.centerLeft,
          child : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment :  MainAxisAlignment.spaceBetween,
            children: [
               Builder(
                builder: (context) => GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: const Icon(Icons.list, size: 28),
                ),
              ),
              Container(
                padding : const EdgeInsets.symmetric(horizontal: 14.0),
                height  : size.height * 0.032,
                child   : Image.asset('assets/platosyplanfondoNaranja.png')
              ),
              SizedBox(
                height: 35,
                width : 35,
                child : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child : const FadeInImage( //TODO: REMPLAZAR CON EL USER_IMAGE
                    placeholder:  AssetImage('assets/food/loading-food.gif'), 
                    image : AssetImage('assets/food/hamburgerBanner.jpg'),
                    fit   : BoxFit.cover,
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}



class _StadisticsRecipe extends StatelessWidget {
  final RecipeModel recipe;
  
  const _StadisticsRecipe({
    required this.recipe
  });

 @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Ajuste vertical más centrado
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye el espacio uniformemente
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.food_bank_outlined, color: Colors.red[700]),
              const SizedBox(width: 5.0), // Reduce el espacio
              Expanded( // Permite que el texto ocupe el espacio restante
                child: Text(
                  recipe.category,
                  style: const TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Icon(Icons.access_time_sharp, color: Theme.of(context).primaryColor),
              const SizedBox(width: 5.0),
              Expanded(
                child: Text(
                  '${recipe.timeCreate} minutos',
                  style: const TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Icon(Icons.food_bank, color: Theme.of(context).primaryColor),
              const SizedBox(width: 5.0),
              Expanded(
                child: Text(
                  recipe.difficulty,
                  style: const TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}