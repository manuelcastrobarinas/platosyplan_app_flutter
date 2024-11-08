part of 'slidershow_bloc.dart';

final class SlidershowState  {
  final double currentPage;
  final bool    dotsUp;
  final Color   primaryColor;
  final Color   secondaryColor;
  final double  bulletPrimary;
  final double  bulletSecondary;

  SlidershowState({
    this.currentPage     = 0,
    this.dotsUp          = false,
    this.primaryColor    = Colors.blue,
    this.secondaryColor  = Colors.grey,
    this.bulletPrimary   = 12.0,
    this.bulletSecondary = 12.0,
  });

  SlidershowState copyWith({
    double? currentPage,
    bool? dotsUp,
    Color? primaryColor,
    Color? secondaryColor,
    double? bulletPrimary,
    double? bulletSecondary,
  }) => SlidershowState(
    currentPage: currentPage ??  this.currentPage,
    dotsUp: dotsUp ?? this.dotsUp,
    primaryColor    : primaryColor    ?? this.primaryColor,
    secondaryColor  : secondaryColor  ?? this.secondaryColor,
    bulletPrimary   : bulletPrimary   ?? this.bulletPrimary,
    bulletSecondary : bulletSecondary ?? this.bulletSecondary  
  );
}
