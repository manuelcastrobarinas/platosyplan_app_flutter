part of 'slidershow_bloc.dart';

@immutable
sealed class SlidershowEvent {}

class OnChangeDotsPositionEvent extends SlidershowEvent {
  final bool isDotsUp;
  OnChangeDotsPositionEvent({required this.isDotsUp});
}

class OnChangePrimaryColorEvent extends SlidershowEvent {
  final Color newPrimaryColor;
  OnChangePrimaryColorEvent({required this.newPrimaryColor});
}

class OnChangeSecondaryColorEvent extends SlidershowEvent {
  final Color secondaryColor;
  OnChangeSecondaryColorEvent({required this.secondaryColor});
}

class OnChangeBulletPrimaryEvent extends SlidershowEvent {
  final double newbulletPrimary;
  OnChangeBulletPrimaryEvent({required this.newbulletPrimary});
}

class OnChangeBulletSecondaryEvent extends SlidershowEvent {
  final double newbulletSecondary;
  OnChangeBulletSecondaryEvent({required this.newbulletSecondary});
}

class OnChangeCurrentPageEvent extends SlidershowEvent {
  final double newCurrentPage;
  OnChangeCurrentPageEvent({required this.newCurrentPage});
}