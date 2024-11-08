import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'slidershow_event.dart';
part 'slidershow_state.dart';

class SlidershowBloc extends Bloc<SlidershowEvent, SlidershowState> {
  SlidershowBloc() : super(SlidershowState()) {
    on<OnChangeDotsPositionEvent>   ((event, emit) => emit(state.copyWith(dotsUp : event.isDotsUp)));
    on<OnChangePrimaryColorEvent>   ((event, emit) => emit(state.copyWith(primaryColor    : event.newPrimaryColor)));
    on<OnChangeSecondaryColorEvent> ((event, emit) => emit(state.copyWith(secondaryColor  : event.secondaryColor)));
    on<OnChangeBulletPrimaryEvent>  ((event, emit) => emit(state.copyWith(bulletPrimary   : event.newbulletPrimary)));
    on<OnChangeBulletSecondaryEvent>((event, emit) => emit(state.copyWith(bulletSecondary : event.newbulletSecondary)));
    on<OnChangeCurrentPageEvent>    ((event, emit) => emit(state.copyWith(currentPage     : event.newCurrentPage)));
  }
  
  //change Dots Position
  void changeDotsPosition({required bool isDotsUp}) => add(OnChangeDotsPositionEvent(isDotsUp: isDotsUp));
  //change Colors
  void changePrimaryColor({required Color newPrimaryColor})     => add(OnChangePrimaryColorEvent(newPrimaryColor: newPrimaryColor));
  void changeSecondaryColor({required Color newSecondaryColor}) => add(OnChangeSecondaryColorEvent(secondaryColor: newSecondaryColor));
  //change bullets
  void changeBulletPrimary({required double newbulletPrimary})     => add(OnChangeBulletPrimaryEvent(newbulletPrimary: newbulletPrimary));
  void changeBulletSecondary({required double newbulletSecondary}) => add(OnChangeBulletSecondaryEvent(newbulletSecondary: newbulletSecondary));
  //change current Page
  void changeCurrentPage({required double newCurrentPage}) => add(OnChangeCurrentPageEvent(newCurrentPage: newCurrentPage));
}
