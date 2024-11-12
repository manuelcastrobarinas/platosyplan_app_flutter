import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _HeaderImage(),
          _InformationContainer(),
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.38,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadiusDirectional.vertical(bottom: Radius.circular(30)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              SizedBox(
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
              Positioned(
                right: 0,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/food/hamburger.png', fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InformationContainer extends StatelessWidget {
  const _InformationContainer();

  @override
  Widget build(BuildContext context) {
    const TextStyle sectionTitleStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 14, overflow: TextOverflow.ellipsis);
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _TitleRecipe(),
            _CountryRecipe(),
            _StadisticsRecipe(),
            _DescriptionRecipe(),
            _Ingredients(sectionTitleStyle: sectionTitleStyle),
            _NutritionalTable(sectionTitleStyle: sectionTitleStyle),
            _Utensils(sectionTitleStyle: sectionTitleStyle),
            SizedBox(height: 10.0),
            _ButtonToReditectSteps(sectionTitleStyle: sectionTitleStyle),
          ],
        ),
      ),
    );
  }
}

class _ButtonToReditectSteps extends StatelessWidget {
  const _ButtonToReditectSteps({
    required this.sectionTitleStyle,
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
      onPressed: (){}, //TODO: DIRIGIR AL PASO A PASO
    );
  }
}

class _Utensils extends StatelessWidget {
  const _Utensils({
    required this.sectionTitleStyle,
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
        ListView.builder( //TODO: REMPLAZAR CON LA LISTA DE UTENCILIOS
          padding: const EdgeInsets.only(top: 0),
          itemCount: 3,
          shrinkWrap: true,
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          itemBuilder: (BuildContext context, int index) {
            return const Text('- Medium Pot');
          },
        )
      ],
    );
  }
}

class _NutritionalTable extends StatelessWidget {
  const _NutritionalTable({
    required this.sectionTitleStyle,
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
                const ListTile(
                  leading : Text('calorias'),
                  trailing: Text('940 kcal'),
                  dense: true,
                ),
                const ListTile(
                  leading : Text('Grasa'),
                  trailing: Text('50 g'),
                  dense: true,
                ),
                const ListTile(
                  leading : Text('Grasa Saturada'),
                  trailing: Text('26 g'),
                  dense: true,
                ),
                const ListTile(
                  leading : Text('Carbohidratos'),
                  trailing: Text('89 g'),
                  dense: true,
                ),
                const ListTile(
                  leading : Text('Azucar'),
                  trailing: Text('10 g'),
                  dense: true,
                ),
                const ListTile(
                  leading : Text('Fibra Dietetica'),
                  trailing: Text('6 g'),
                  dense: true,
                ),
                const ListTile(
                  leading : Text('Proteina'),
                  trailing: Text('26 g'),
                  dense: true,
                ),
                const ListTile(
                  leading : Text('Colesterol'),
                  trailing: Text('115 mg'),
                  dense: true,
                ),
                const ListTile(
                  leading : Text('Sodio'),
                  trailing: Text('1260 mg'),
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
  const _Ingredients({
    required this.sectionTitleStyle,
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
            itemCount: 6,
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
                  title   : const Text("igrendiente"),
                  trailing: const Text('2 unidades'),
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
  const _DescriptionRecipe();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "MAECANAS SED DIAM EGET RDolor exercitation in laborum eu labore est. Minim ad aliqua est sit amet incididunt in culpa voluptate. Nostrud officia qui eu commodo excepteur commodo in esse nostrud adipisicing laboris laborum irure.",
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 10,
    );
  }
}

class _StadisticsRecipe extends StatelessWidget {
  const _StadisticsRecipe();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.star_border_outlined, weight: 10, fill: 1, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              const Text('4.7', style: TextStyle(fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time_sharp, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              const Text('20 minutos', style: TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.fireplace_outlined, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              const Text('940 calorias', style: TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.food_bank, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              const Text('facíl', style: TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
        ],
      ),
    );
  }
}

class _CountryRecipe extends StatelessWidget {
  const _CountryRecipe();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.fastfood_rounded, color: Colors.red[900]),
        const SizedBox(width: 10.0),
        const Text('Italiano', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis, fontSize: 16), maxLines: 2),
      ],
    );
  }
}

class _TitleRecipe extends StatelessWidget {
  const _TitleRecipe();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text('Burger Bistro', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 20), maxLines: 2),
    );
  }
}