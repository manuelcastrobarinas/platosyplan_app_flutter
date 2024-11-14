import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/steps.dart';
import '../slidershow/slidershow_bloc.dart';

part 'steps_event.dart';
part 'steps_state.dart';

List<Steps> stepsCooking = <Steps>[
  Steps(
    imageUrl: SvgPicture.asset('assets/svgs/slide-1.svg'), 
    description: "Ajuste la rejilla a la posición superior y precaliente el horno a 425 grados, en un puerto mediano (olla grande para 5 porciones), a fuego lento. lavar y secar los productos. corte el brócoli en trozos pequeños si es necesario. recorte y corte en rodajas finas las cebolletas, separando las blancas de las verdes. Mezcle el brócoli en una hoja de baj¿king con un chorrito de aceite, sal y pimienta. Ase hasta que esté dorado y tierno, de 15 a 20 minutos. Ajuste la rejilla a la posición superior y precaliente el horno a 425 grados, en un puerto mediano (olla grande para 5 porciones), a fuego lento. lavar y secar los productos. corte el brócoli en trozos pequeños si es necesario. recorte y corte en rodajas finas las cebolletas, separando las blancas de las verdes. Mezcle el brócoli en una hoja de baj¿king con un chorrito de aceite, sal y pimienta. Ase hasta que esté dorado y tierno, de 15 a 20 minutos.", 
    ingredientesStep: [
      const Ingredients(name: 'Arroz', image: 'adsasdas.jpg', units: 3),
      const Ingredients(name: 'Papa', image: 'papa.png', units: 3),
      const Ingredients(name: 'Yuca', image: 'yuca.png', units: 2)
    ], 
    utensiliosStep: ['paila', 'hoya arrocera']
  ),
  Steps(
    imageUrl: SvgPicture.asset('assets/svgs/slide-2.svg'),
    description: 'Este es el paso numero dos y no se que mas poner en la descripcion', 
    ingredientesStep: [
      const Ingredients(name: 'maiz',   image: 'maiz.jpg',    units: 3),
      const Ingredients(name: 'arbeja', image: 'arbeja.png',  units: 3),
      const Ingredients(name: 'tomate', image: 'tomate.png',  units: 2)
    ],
    utensiliosStep: ['paila']
  ),
   Steps(
    imageUrl: SvgPicture.asset('assets/svgs/slide-3.svg'),
    description: 'Este es el paso numero tres y no se que mas poner en la descripcion', 
    ingredientesStep: [],
    utensiliosStep: ['paila']
  ),
];

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

  Future<String> getCookingSteps() async {
    final List<Steps> steps = stepsCooking;
    add(OnGetCookingStepsEvent(steps: steps));
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