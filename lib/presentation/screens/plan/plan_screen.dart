import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:platosyplan/components/components.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child : _UncreatedPlan(size: size),
    );
  }
}

class _UncreatedPlan extends StatelessWidget {
  
  const _UncreatedPlan({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.75,
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,  
        children: [
           SizedBox(
            height: size.height * 0.4,
            child : SvgPicture.asset('assets/svgs/selectplan.svg')
          ),
          Container(
            margin : const EdgeInsets.symmetric(horizontal: 30.0),
            child  : const Text('Recibe ingredientes frescos y porcionados junto con recetas sencillas para preparar platos deliciosos en casa.', style :  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black), textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ButtonComponent(
              text      : 'Crea tu plan semanal',
              minHeight : 50, 
              minWidth  : size.width * 0.8, 
              isLoading : false,
              function  : () {}  //TODO: REDIRIGE A LA CREACION DEL PLAN
            ),
          )
        ]
      ),
    );
  }
}

//TODO: HACER DOS SECCIONES, 1) donde no se haya creado el plan, 2) donde el plan ya este creado