import 'package:flutter/material.dart';
import 'package:platosyplan/components/components.dart';

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
            child : Column(
              mainAxisAlignment : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                ButtonComponent(
                  minWidth: size.width * 0.85, 
                  minHeight: 50, 
                  function: () => Navigator.pushNamed(context, 'nameanddescription'), 
                  text: 'Crear Receta', 
                  isLoading: false
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('recetas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('5 creadas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                _ListOfRecipesCreated(scrollController: scrollController),
                const SizedBox(height: 30),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class _ListOfRecipesCreated extends StatelessWidget {
  const _ListOfRecipesCreated({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller  : scrollController,
      shrinkWrap  : true,
      itemCount   : 15,
      separatorBuilder: (context, index) => const Divider(height: 10, color: Colors.black12),
      itemBuilder : (context, index) =>  ListTile(
        dense   : true,
        title   : const Text('Hamburguesa', style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis), maxLines: 1),
        subtitle: const Text('Hamburguesa', style: TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis), maxLines: 1),
        leading : const SizedBox(
          height  : 45,
          width   : 45,
          child   : FadeInImage(
            fit     : BoxFit.cover,
            placeholder:  AssetImage("assets/food/loading-food.gif"), 
            image:  AssetImage("assets/food/hamburgerBanner.jpg")
          ),
        ),
        trailing: Switch(
          activeTrackColor: Theme.of(context).primaryColor,
          activeColor: Theme.of(context).primaryColorLight,
          inactiveTrackColor: Theme.of(context).primaryColorLight,
          inactiveThumbColor: Theme.of(context).primaryColor,
          value: true, 
          onChanged: (value) {} //TODO: Cambiar el estado de la receta
        ),
      ),
    );
  }
}