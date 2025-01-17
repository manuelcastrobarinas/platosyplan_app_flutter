part of 'plan_bloc.dart';

final class PlanState {
  final int peopleActive;
  //LOADING REQUEST
  bool isLoadingRequest;

  PlanState({
    this.peopleActive = 0,
    this.isLoadingRequest = false,
  });

  PlanState copyWith({
    int? peopleActive,
    bool? isLoadingRequest,
  }) => PlanState(
    peopleActive    : peopleActive      ?? this.peopleActive,
    isLoadingRequest: isLoadingRequest  ?? this.isLoadingRequest,
  );
}