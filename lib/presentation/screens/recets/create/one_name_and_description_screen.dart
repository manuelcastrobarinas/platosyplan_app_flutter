import 'package:flutter/material.dart';
import '../../../../components/components.dart';

class NameAndDescriptionScreen extends StatelessWidget {
  const NameAndDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<bool> stepsStatus = [true, false, false, false];
    
    return SizedBox(
      // color: Colors.grey[200],
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: TimelineVerticalComponent(stepsStatus: stepsStatus, heightToSpaceToNodes: size.height * 0.14),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 35.0),
                width : double.infinity,
                height: double.infinity,
                color : Colors.white,
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment : MainAxisAlignment.start,
                  children: [
                    const Text('Nombre y descripción', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 10.0),
                    const Text('Escribe el nombre del producto y su respectiva descripción. Recuerda que la redaccion debe ser clara y concisa. ademas debes tener en cuenta la ortografia y gramatica.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
                    const SizedBox(height: 30.0),
                    TextformfieldComponent(
                      icon: Icons.title,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      label: "Titulo del producto",
                      suffixText: "titulo",
                    ),
                    const SizedBox(height: 30.0),
                    TextformfieldComponent(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      label: "descripción del producto",
                      suffixText: "describe",              
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Categoría', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                          SizedBox(height: 10.0),
                          Text('Selecciona la categoría a la que pertenece de la receta para que sea mas facil encontrarla por los demas usuarios.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify), 
                          SizedBox(height: 10.0),
                          CategorySelectorComponent()
                        ],
                      ),
                    ),         
                    const SizedBox(height: 50.0),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        ButtonComponent(
                          minHeight : 45,
                          isLoading : false,
                          minWidth  : size.width * 0.45,
                          text      : 'Siguiente', 
                          function  : () => Navigator.pushNamed(context, 'selectimagerecipe'),
                        ),
                      ],
                    ),
                  ]
                )
              )
            )
          ]
        ),
      ),
    );
  }
}

  // time_create
  // difficulty
  
  
  // ingredients
  // nutricional_table
  // utensils
  // steps