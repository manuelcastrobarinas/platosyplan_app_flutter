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
        constraints:  BoxConstraints(
          minHeight: size.height,
        ),
        child: BlocBuilder<RecipesBloc, RecipesState>(
          builder: (context, state) {
            if(state is RecipesInitial) {
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
                          child: _RecipesCards(recipe: recipe, sectionTitleStyle: sectionTitleStyle, size: size),
                        ),
                      );
                    }
                  )
                ],
              );
            }
            return const Text('No data');
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
    required this.size,
  });

  final RecipeModel recipe;
  final TextStyle sectionTitleStyle;
  final Size size;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: _ImageTitleAndDescriptionRecipeCard(recipe: recipe, sectionTitleStyle: sectionTitleStyle)
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration : const BoxDecoration(
                      color : Color(0xfff6f7fc),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
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
                              image: NetworkImage(recipe.image)
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding : const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  height  : 50,
                  width   : double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xfff6f7fc),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StadisticsRecipe(recipe: recipe)
                      ]
                    ),
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
      width : double.infinity,
      height: size.height * 0.15,
      color : Theme.of(context).primaryColor,
      child : SafeArea(
        child : Align(
          alignment: Alignment.centerLeft,
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Bienvenido a", style: titleStyle.copyWith(color: Colors.white)),
              ),
              Container(
                padding : const EdgeInsets.symmetric(horizontal: 14.0),
                height  : size.height * 0.042,
                child   : Image.asset('assets/platosyplanfondo.png')
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
      crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.food_bank_outlined, color: Colors.red[700]),
              const SizedBox(width: 10.0),
              Text(recipe.createRegion, style: const TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time_sharp, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              Text('${recipe.timeCreate} minutos', style: const TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.food_bank, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              Text(recipe.difficulty, style: const TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
        ],
      );
  }
}