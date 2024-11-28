import 'package:flutter/material.dart';
import 'package:platosyplan/models/recipe.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeModel recipe = ModalRoute.of(context)!.settings.arguments as RecipeModel;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _HeaderImage(heroId: recipe.id, imageUrl: recipe.image),
          _InformationContainer(recipe: recipe,)
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final String heroId;
  final String imageUrl;
  
  const _HeaderImage({
    required this.heroId,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.38,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadiusDirectional.vertical(bottom: Radius.circular(30)),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width : double.infinity,
            child: Hero(
              tag: heroId,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30.0)),
                child: Image.network(imageUrl, fit: BoxFit.cover)
              )
            ),
          ),
          Center(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 20, spreadRadius: 1),
                ],
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
              child: SizedBox(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 24,
                    minRadius: 15,
                    child: Icon(Icons.arrow_back_ios_rounded, size: 22, fill: 1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                child: SizedBox(
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 24,
                      minRadius: 15,
                      child: Icon(
                        Icons.favorite_rounded,
                        size: 22,
                        fill: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InformationContainer extends StatelessWidget {

  final RecipeModel recipe;

  const _InformationContainer({required this.recipe});

  @override
  Widget build(BuildContext context) {
    const TextStyle sectionTitleStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 14, overflow: TextOverflow.ellipsis);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _TitleRecipe(recipeTitle: recipe.name),
            _CountryRecipe(countryRecipe: recipe.createRegion),
            _StadisticsRecipe(
              calories  : recipe.nutricionalTable.calories!.amount.toString(),
              difficulty: recipe.difficulty,
              score     : recipe.calification.toString(),
              time      : recipe.timeCreate.toString(),
            ),
            _DescriptionRecipe(description: recipe.description),
            _Ingredients(sectionTitleStyle: sectionTitleStyle, ingredientList: recipe.ingredients!),
            _NutritionalTable(sectionTitleStyle: sectionTitleStyle, nutricionalTable: recipe.nutricionalTable,),
            _Utensils(sectionTitleStyle: sectionTitleStyle, utensilios: recipe.utensils!),
            const SizedBox(height: 10.0),
            _ButtonToReditectSteps(sectionTitleStyle: sectionTitleStyle, stepsList: recipe.steps!),
          ],
        ),
      ),
    );
  }
}

class _ButtonToReditectSteps extends StatelessWidget {
  final List<StepCooking> stepsList;
  
  const _ButtonToReditectSteps({
    required this.sectionTitleStyle,
    required this.stepsList
  });

  final TextStyle sectionTitleStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      elevation: 1,
      color: Theme.of(context).primaryColorLight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("PASOS DE PREPARACION", style: sectionTitleStyle.copyWith(color: Theme.of(context).primaryColor), maxLines: 1),
          Icon(Icons.ads_click, color: Theme.of(context).primaryColor),
        ]
      ),
      onPressed: () => Navigator.pushNamed(context, 'cookingsteps', arguments: stepsList)
    );
  }
}

class _Utensils extends StatelessWidget {
  final List<Utensil> utensilios;

  const _Utensils({
    required this.sectionTitleStyle,
    required this.utensilios
  });

  final TextStyle sectionTitleStyle;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      childrenPadding: const EdgeInsets.only(bottom: 20),
      collapsedIconColor: Colors.black,
      dense: false,
      visualDensity: VisualDensity.standard,
      shape: const Border(),
      title: Text("UTENSILIOS", style: sectionTitleStyle, maxLines: 1),
      subtitle: const Text("para este plato tienes 6 ingredientes", maxLines: 1),
      trailing: const Icon(Icons.arrow_drop_down),
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount: utensilios.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          itemBuilder: (BuildContext context, int index) {
            return Text('- ${utensilios[index].name}');
          },
        )
      ],
    );
  }
}

class _NutritionalTable extends StatelessWidget {
  final NutricionalTable nutricionalTable;

  const _NutritionalTable({
    required this.sectionTitleStyle,
    required this.nutricionalTable
  });

  final TextStyle sectionTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.black12),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(0),
        childrenPadding: const EdgeInsets.only(bottom: 20),
        collapsedIconColor: Colors.black,
        dense: false,
        visualDensity: VisualDensity.standard,
        title : Text("TABLA NUTRICIONAL", style: sectionTitleStyle, maxLines: 1),
        subtitle: const Text("conoce las cantidades nutricionales", maxLines: 1),
        trailing: const Icon(Icons.arrow_drop_down),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5)
            ),
            width: double.infinity,
            height: 30,
            child : const Center(
              child: Text('por porcion', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900)),
            ),
          ),
          ListView(
            physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top:10.0),
            children: ListTile.divideTiles(
              color: Colors.black12,
              context: context,
              tiles: [
                ListTile(
                  leading : const Text('calorias'),
                  trailing: Text('${nutricionalTable.calories!.amount.toString()} Kcal'),
                  dense: true,
                ),
                ListTile(
                  leading : const Text('Grasa'),
                  trailing: Text('${nutricionalTable.fat!.amount.toString()} g'),
                  dense: true,
                ),
                ListTile(
                  leading : const Text('Grasa Saturada'),
                  trailing: Text('${nutricionalTable.saturedFat!.amount.toString()} g'),
                  dense: true,
                ),
                ListTile(
                  leading : const Text('Carbohidratos'),
                  trailing: Text('${nutricionalTable.carbohidrate!.amount.toString()} g'),
                  dense: true,
                ),
                ListTile(
                  leading : const Text('Azucar'),
                  trailing: Text('${nutricionalTable.sugar!.amount.toString()} g'),
                  dense: true,
                ),
                ListTile(
                  leading : const Text('Fibra Dietetica'),
                  trailing: Text('${nutricionalTable.dietaryFiber!.amount.toString()} g'),
                  dense: true,
                ),
                ListTile(
                  leading : const Text('Proteina'),
                  trailing: Text('${nutricionalTable.protein!.amount.toString()} g'),
                  dense: true,
                ),
                ListTile(
                  leading : const Text('Colesterol'),
                  trailing: Text('${nutricionalTable.cholesterol!.amount.toString()} mg'),
                  dense: true,
                ),
                ListTile(
                  leading : const Text('Sodio'),
                  trailing: Text('${nutricionalTable.sodium!.amount.toString()} mg'),
                  dense: true,
                ),
              ]
            ).toList()  
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Debido a los diferentes proveedores a los que compramos nuestros productos, los datos nutricionales por comida pueden variar desde el sitio web hasta lo que se recibe en esta caja entregada, dependiendo de su región.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class _Ingredients extends StatelessWidget {
  final List<Ingredient> ingredientList;
  
  const _Ingredients({
    required this.sectionTitleStyle,
    required this.ingredientList
  });

  final TextStyle sectionTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(0),
        childrenPadding: const EdgeInsets.only(bottom: 20),
        collapsedIconColor: Colors.black,
        dense: false,
        visualDensity: VisualDensity.standard,
        shape: const Border(),
        title: Text("INGREDIENTES", style: sectionTitleStyle, maxLines: 1),
        subtitle: SizedBox(
          height: 80,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 15.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  maxRadius: 27,
                  minRadius: 25,
                  child: Icon(
                    Icons.fastfood_rounded,
                    size: 20,
                    fill: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              );
            },
          ),
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 5),
            itemCount: ingredientList.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListTile(
                  leading : Container(
                    decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child: Image.asset('assets/food/hamburger.png', fit: BoxFit.cover)
                  ),
                  title   : Text(ingredientList[index].name),
                  trailing: Text(ingredientList[index].units.toString()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _DescriptionRecipe extends StatelessWidget {
  final String description;
  const _DescriptionRecipe({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 10,
    );
  }
}

class _StadisticsRecipe extends StatelessWidget {
  final String score;
  final String time;
  final String calories;
  final String difficulty;

  const _StadisticsRecipe({required this.score, required this.time, required this.calories, required this.difficulty});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.star_border_outlined, weight: 10, fill: 1, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              Text(score, style: const TextStyle(fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time_sharp, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              Text('$time minutos', style: style, maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.fireplace_outlined, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              Text('$calories calorias', style: style, maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.food_bank, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              Text(difficulty, style: style, maxLines: 1)
            ],
          ),
        ],
      ),
    );
  }
}

class _CountryRecipe extends StatelessWidget {
  final String countryRecipe;

  const _CountryRecipe({required this.countryRecipe});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.fastfood_rounded, color: Colors.red[900]),
        const SizedBox(width: 10.0),
        Text(countryRecipe, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis, fontSize: 16), maxLines: 2),
      ],
    );
  }
}

class _TitleRecipe extends StatelessWidget {
  final String recipeTitle;
  const _TitleRecipe({required this.recipeTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(recipeTitle, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 20), maxLines: 2),
    );
  }
}
