part of 'steps_bloc.dart';

@immutable
sealed class StepsState {}

final class StepsInitial extends StepsState {
  final List<StepCooking>? steps;
  final int indexElement;

  StepsInitial({
    this.steps,
    this.indexElement = 0
  });

  StepsInitial copyWith({
    List<StepCooking>? steps,
    int? indexElement
  }) => StepsInitial(
    steps: steps ?? this.steps,
    indexElement: indexElement ?? this.indexElement
  );
}
