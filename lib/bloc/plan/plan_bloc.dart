import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(PlanState()) {
    on<OnChangePeopleNumberToPlanEvent>     ((event, emit) => emit(state.copyWith(peopleActive: event.newPeopleNumber)));
    on<OnChangeMeelsNumberPerWeekPlanEvent> ((event, emit) => emit(state.copyWith(meelsPerWeek: event.newMeelsPerWeek)));
  }

  void changePeopleNumberPlan({required int newPeopleNumber}) => add(OnChangePeopleNumberToPlanEvent(newPeopleNumber: newPeopleNumber));
  void changeMeelsPerWeekPlan({required int newMeelsPerWeek}) => add(OnChangeMeelsNumberPerWeekPlanEvent(newMeelsPerWeek: newMeelsPerWeek));
}
