part of 'steps_bloc.dart';

@immutable
sealed class StepsEvent {}

class OnGetCookingStepsEvent extends StepsEvent {
  final List<StepCooking> steps;
  
  OnGetCookingStepsEvent({
    required this.steps
  });
}

class OnChangeIndexItem extends StepsEvent {
  final int index;
  OnChangeIndexItem({required this.index});
}


class OnEndStreamScreenClosed extends StepsEvent {} // Nuevo evento para detener el Stream en las pantallas (YA QUE EL BLOC SE EJECUTA EN EL MAIN (A NIVEL SUPERIOR))