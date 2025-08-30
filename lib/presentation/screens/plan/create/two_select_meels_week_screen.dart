import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/plan/plan_bloc.dart';
import 'package:platosyplan/constants.dart';

import '../../../../components/components.dart';

class SelectedMeelsWeekPlanScreen extends StatelessWidget {
  const SelectedMeelsWeekPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        centerTitle: true,
        title : const Text('Crea tu plan', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          TextButton(
            child: Text('Cancelar', style: TextStyle(color: Theme.of(context).primaryColor)),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, 'navegation', (Route<dynamic> route) => false),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _ProgressBar(),
              Padding(
                padding : const EdgeInsets.symmetric(horizontal: 20.0),
                child   : _Content(size: size),
              ),
              ButtonComponent(
                text      : 'continuar',
                minHeight : 50, 
                minWidth  : size.width * 0.8, 
                isLoading : false,
                function  : () => Navigator.pushNamed(context, 'selectplan')
              ),
              const SizedBox()
            ],
          ),
        ),
      )
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 70,
          width : double.infinity,
        ),
        Divider(color: kScaffoldbackgroundColor, height: 0, thickness: 5),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final Size size;
  
  const _Content({
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    final List<int> buildCardIndex = <int> [2, 3, 4, 5, 6];

    return SizedBox(
      height: size.height * 0.7,
      child :  Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        mainAxisAlignment : MainAxisAlignment.start,
        children: <Widget> [
          const Text("¿cuantas comidas te gusta por semana? 🍜", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
          const Expanded(child: SizedBox()),
          BlocBuilder<PlanBloc, PlanState>(
            builder: (BuildContext context, PlanState state) {
              return Column(
                children: <Widget> [
                  Wrap(
                    alignment : WrapAlignment.center,
                    children  : buildCardIndex.map((index) {
                      return SelectAmountCardComponent(
                        value : index,
                        stateIntValue: state.meelsPerWeek,
                        function : () => BlocProvider.of<PlanBloc>(context).changeMeelsPerWeekPlan(newMeelsPerWeek: index),
                      );
                    }).toList()
                  ),
                  Padding(
                    padding : const EdgeInsets.only(top: 20.0),
                    child   : _buildText(state.meelsPerWeek),
                  ),
                ],
              );
            },
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _buildText(int peopleActive) {
    const TextStyle textStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
    switch (peopleActive) {
      case 2  : return const Text("ideal para salir de la rutina de cocinar", style: textStyle, textAlign: TextAlign.center);
      case 3  : return const Text("nuestro plan mas popular para pasar la semana", style: textStyle, textAlign: TextAlign.center);
      case 4  : return const Text("mantente al dia y ocupa tus noches en la semana", style: textStyle, textAlign: TextAlign.center);
      case 5  : return const Text("conquista las cenas de lunes a viernes", style: textStyle, textAlign: TextAlign.center);
      case 6  : return const Text("tacha ``planificar la cena´´ de tu lista", style: textStyle, textAlign: TextAlign.center);
      default : return const Text("selecciona la cantidad de comidas que deseas recibir", style: textStyle, textAlign: TextAlign.center);

    }
  }
}