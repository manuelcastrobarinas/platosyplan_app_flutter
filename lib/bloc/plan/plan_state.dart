part of 'plan_bloc.dart';

final class PlanState {
  final int peopleActive;
  final int meelsPerWeek;
  //LOADING REQUEST
  bool isLoadingRequest;

  PlanState({
    this.peopleActive = 0,
    this.meelsPerWeek = 0,
    this.isLoadingRequest = false,
  });

  PlanState copyWith({
    int? peopleActive,
    int? meelsPerWeek,
    bool? isLoadingRequest,
  }) => PlanState(
    peopleActive    : peopleActive      ?? this.peopleActive,
    meelsPerWeek    : meelsPerWeek      ?? this.meelsPerWeek,
    isLoadingRequest: isLoadingRequest  ?? this.isLoadingRequest,
  );
}