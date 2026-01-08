import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  final TimelineTileBuilder builder;
  final TimelineThemeData? theme;

  const Timeline({
    super.key,
    required this.builder,
    this.theme,
  });

  static TimelineTileBuilder tileBuilder({
    required TimelineTileBuilder builder,
    TimelineThemeData? theme,
  }) {
    return builder;
  }

  @override
  Widget build(BuildContext context) {
    return builder.build(context, theme);
  }
}

class TimelineTileBuilder {
  final Widget Function(BuildContext, TimelineThemeData?) build;

  const TimelineTileBuilder({required this.build});

  static TimelineTileBuilder connected({
    required Widget Function(BuildContext, int, bool) connectorBuilder,
    required Widget Function(BuildContext, int) indicatorBuilder,
    required double Function(BuildContext, int) itemExtentBuilder,
    required int itemCount,
  }) {
    return TimelineTileBuilder(
      build: (context, theme) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(itemCount, (index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Indicador (círculo)
                indicatorBuilder(context, index),
                // Conector hacia abajo (excepto para el último)
                if (index < itemCount - 1)
                  connectorBuilder(context, index, false),
              ],
            );
          }),
        );
      },
    );
  }
}

class TimelineThemeData {
  final double nodePosition;
  final ConnectorThemeData? connectorTheme;
  final IndicatorThemeData? indicatorTheme;

  const TimelineThemeData({
    this.nodePosition = 0,
    this.connectorTheme,
    this.indicatorTheme,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineThemeData &&
        other.nodePosition == nodePosition &&
        other.connectorTheme == connectorTheme &&
        other.indicatorTheme == indicatorTheme;
  }

  @override
  int get hashCode {
    return Object.hash(nodePosition, connectorTheme, indicatorTheme);
  }
}

class ConnectorThemeData {
  final double thickness;
  final Color? color;

  const ConnectorThemeData({
    this.thickness = 2.0,
    this.color,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConnectorThemeData &&
        other.thickness == thickness &&
        other.color == color;
  }

  @override
  int get hashCode {
    return Object.hash(thickness, color);
  }
}

class IndicatorThemeData {
  final double size;
  final Color? color;
  final double? position;

  const IndicatorThemeData({
    this.size = 20.0,
    this.color,
    this.position,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IndicatorThemeData &&
        other.size == size &&
        other.color == color &&
        other.position == position;
  }

  @override
  int get hashCode {
    return Object.hash(size, color, position);
  }
}

class SolidLineConnector extends StatelessWidget {
  final Color? color;
  final double? thickness;

  const SolidLineConnector({
    super.key,
    this.color,
    this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: thickness ?? 5,  // Línea más delgada
      height: 50,                // Altura más compacta
      color: color ?? Colors.grey.shade300,  // Color más suave
    );
  }
}

class OutlinedDotIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final Widget? child;

  const OutlinedDotIndicator({
    super.key,
    this.size,
    this.color,
    this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final indicatorSize = size ?? 35.0;  // Tamaño más pequeño
    final indicatorColor = color ?? Colors.grey.shade400;
    final indicatorBackgroundColor = backgroundColor ?? Colors.transparent;

    return Container(
      width: indicatorSize,
      height: indicatorSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: indicatorBackgroundColor,
        border: Border.all(
          color: indicatorColor,
          width: 1.5,  // Borde más delgado
        ),
      ),
      child: child,
    );
  }
}

class DotIndicator extends StatelessWidget {
  final Color? color;
  final Widget? child;

  const DotIndicator({
    super.key,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,  // Tamaño fijo y pequeño
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.grey.shade400,
      ),
      child: child,
    );
  }
}
