import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(PlanState()) {
    on<OnChangePeopleNumberToPlanEvent>((event, emit) => emit(state.copyWith(peopleActive: event.newPeopleNumber)));
  }

  void changePeopleNumberPlan({required int newPeopleNumber}) => add(OnChangePeopleNumberToPlanEvent(newPeopleNumber: newPeopleNumber));
  
}
