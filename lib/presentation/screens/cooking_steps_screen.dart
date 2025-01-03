import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/components/progress/slidershow_component.dart';
import 'package:platosyplan/models/recipe.dart';

import '../../bloc/steps/steps_bloc.dart';

class CookingStepsScreen extends StatefulWidget {
  const CookingStepsScreen({super.key});

  @override
  State<CookingStepsScreen> createState() => _CookingStepsScreenState();
}

class _CookingStepsScreenState extends State<CookingStepsScreen> {
  late final StepsBloc stepsBloc;

  @override
  void initState() {
    stepsBloc = BlocProvider.of<StepsBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    stepsBloc.add(OnEndStreamScreenClosed()); //Nos encargamos  de cancelar el stream antes de cerrar la pantalla
    stepsBloc.add(OnChangeIndexItem(index: 0));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle sectionTitleStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 14, overflow: TextOverflow.ellipsis);

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: BlocBuilder<StepsBloc, StepsState>(
          builder: (context, state) {
            if (state is StepsInitial) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment : MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Theme.of(context).primaryColorLight,
                      height: MediaQuery.of(context).size.height * 0.45,
                      width : double.infinity,
                      child: SlideshowComponent(
                        changeIndexItemGenericBloc: stepsBloc.changeIndexItem,
                        context: context,
                        primaryColor: Theme.of(context).primaryColor,
                        slides: state.steps!.map((slide) => FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: const AssetImage('assets/food/loading-food-two.gif'), 
                          image: NetworkImage(slide.image)
                        )).toList()
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Center(
                        child: Text(
                          "PASO ${state.indexElement + 1}",
                          textAlign: TextAlign.justify,
                          style: sectionTitleStyle.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Text(state.steps![state.indexElement].description, textAlign: TextAlign.justify),
                    ),
                    _Utensils(sectionTitleStyle: sectionTitleStyle, utensiliosList: state.steps![state.indexElement].utensiliosSteps),
                    _Ingredients(sectionTitleStyle: sectionTitleStyle, ingredientsSteps: state.steps![state.indexElement].ingredientsSteps!)      
                  ],
                );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class _Utensils extends StatelessWidget {

  final TextStyle sectionTitleStyle;
  final List<Utensil>? utensiliosList;

  const _Utensils({
    required this.sectionTitleStyle,
    required this.utensiliosList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(20.0),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        collapsedIconColor: Colors.black,
        dense: false,
        visualDensity: VisualDensity.standard,
        shape: const Border(),
        title: Text("UTENSILIOS", style: sectionTitleStyle, maxLines: 1),
        subtitle: utensiliosList != null ? Text("para este paso necesitas ${utensiliosList!.length} elementos", maxLines: 1) : const  Text("No necesitas utensilios", maxLines: 1) ,
        trailing: const Icon(Icons.arrow_drop_down),
        enabled: utensiliosList != null ? true : false,
        children: (utensiliosList != null) ? [
          ListView.builder(
            padding: const EdgeInsets.only(top: 0),
            itemCount: utensiliosList!.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            itemBuilder: (BuildContext context, int index) {
              return Text('- ${utensiliosList![index].name}', style: const TextStyle(fontWeight: FontWeight.w900),);
            },
          )
        ] : [],
      ),
    );
  }
}

class _Ingredients extends StatelessWidget {
  final TextStyle sectionTitleStyle;
  final List<Ingredient> ingredientsSteps;

  const _Ingredients({
    required this.sectionTitleStyle,
    required this.ingredientsSteps
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 10.0),
        childrenPadding: const EdgeInsets.only(bottom: 20),
        collapsedIconColor: Colors.white,
        collapsedBackgroundColor: ingredientsSteps.isEmpty ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColor,
        dense: false,
        visualDensity: VisualDensity.standard,
        shape: const Border(),
        collapsedShape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        title: ingredientsSteps.isNotEmpty 
          ? Text("INGREDIENTES EN ESTE PASO", style: sectionTitleStyle.copyWith(color: Colors.white), maxLines: 1) 
          : Text('ESTE PASO NO TIENE INGREDIENTES', style: sectionTitleStyle.copyWith(color: Colors.white), maxLines: 2),
        trailing: const Icon(Icons.arrow_drop_down),
        enabled: ingredientsSteps.isNotEmpty ? true : false,
        children: ingredientsSteps.isNotEmpty ? [
          ListView.builder(
            padding: const EdgeInsets.only(top: 5),
            itemCount: ingredientsSteps.length,
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
                    child: FadeInImage(
                      height: 50,
                      width : 50,
                      fit: BoxFit.fitWidth,
                      placeholder: const AssetImage("assets/food/loading-food.gif"), 
                      image : NetworkImage(ingredientsSteps[index].image!),
                      placeholderErrorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) => const Icon(Icons.image_not_supported, size: 30),
                    )
                  ),
                  title   : Text(ingredientsSteps[index].name),
                  trailing: Text('${ingredientsSteps[index].units} unidades', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
                ),
              );
            },
          )
        ] : [],
      ),
    );
  }
}