import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:platosyplan/models/recipe.dart';

import '../slidershow/slidershow_bloc.dart';

part 'steps_event.dart';
part 'steps_state.dart';

class StepsBloc extends Bloc<StepsEvent, StepsState> {

  final SlidershowBloc slideshowBloc;
  StreamSubscription? slideshowSubscription; //creamos el stream asi porque buscamos que se inicialize cuando se ejecute el metodo de cambio de index

  StepsBloc({required this.slideshowBloc}) : super(StepsInitial()) {
    if (state is StepsInitial) {
      on<OnGetCookingStepsEvent>((event, emit) => emit((state as StepsInitial).copyWith(steps: event.steps) )); 
      on<OnChangeIndexItem>     ((event, emit) => emit((state as StepsInitial).copyWith(indexElement: event.index) )); 
      
      on<OnEndStreamScreenClosed>        ((event, emit) {  //manejador de evento para limpiar el stream (Debe ejecutarse siempre en un Screen para finalizarlo)
        slideshowSubscription?.cancel();
        slideshowSubscription = null;
      });
    }
  }

  Future<String> getCookingSteps({required List<StepCooking>stepsCooking}) async {
    add(OnGetCookingStepsEvent(steps: stepsCooking));
    return 'success';
  }

  void changeIndexItem() {
    slideshowSubscription?.cancel(); // Cancela la suscripción anterior si ya existe

    // Asignamos la nueva suscripción
    slideshowSubscription = slideshowBloc.stream.listen((slideshowState) {
      final currentPage = slideshowState.currentPage;
      if (currentPage == currentPage.roundToDouble()) {
        add(OnChangeIndexItem(index: currentPage.toInt()));
      }
    });
  }
    
  @override
  Future<void> close() {
    slideshowSubscription?.cancel(); // Cancelamos la suscripción solo si slideshowSubscription ha sido inicializado
    return super.close();
  }
}