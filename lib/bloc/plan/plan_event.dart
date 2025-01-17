part of 'plan_bloc.dart';

@immutable
sealed class PlanEvent {}

class OnChangePeopleNumberToPlanEvent extends PlanEvent{
  final int newPeopleNumber;
  OnChangePeopleNumberToPlanEvent({required this.newPeopleNumber});
}
