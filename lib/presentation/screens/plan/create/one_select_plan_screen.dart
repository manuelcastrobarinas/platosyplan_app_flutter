import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platosyplan/bloc/plan/plan_bloc.dart';
import 'package:platosyplan/constants.dart';

import '../../../../components/components.dart';

class SelectedPlanScreen extends StatelessWidget {
  const SelectedPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        centerTitle: true,
        title : const Text('Crea tu plan', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          TextButton(
            child: Text('Cancelar', style: TextStyle(color: Theme.of(context).primaryColor)),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, 'navegation', (Route<dynamic> route) => false),
          )
        ],
      ),
      body: SizedBox(
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
    final List<int> buildCardIndex = <int> [2, 3, 4, 6];

    return SizedBox(
      height: size.height * 0.7,
      child :  Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        mainAxisAlignment : MainAxisAlignment.start,
        children: <Widget> [
          const Text("¿Cuántas personas habrá en la mesa?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
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
                        stateIntValue: state.peopleActive,
                        function : () => BlocProvider.of<PlanBloc>(context).changePeopleNumberPlan(newPeopleNumber: index),
                      );
                    }).toList()
                  ),
                  Padding(
                    padding : const EdgeInsets.only(top: 20.0),
                    child   : _buildText(state.peopleActive),
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
      case 2  : return const Text("para parejas o para una persona a quien le gusta preparar comidas", style: textStyle, textAlign: TextAlign.center);
      case 3  : return const Text("porque todo lo bueno viene de tres en tres", style: textStyle, textAlign: TextAlign.center);
      case 4  : return const Text("genial para cenar con amigos y familia", style: textStyle, textAlign: TextAlign.center);
      case 6  : return const Text("perfecto para disfrutar con una gran familia", style: textStyle, textAlign: TextAlign.center);
      default : return const Text("selecciona la cantidad de personas", style: textStyle, textAlign: TextAlign.center);

    }
  }
}