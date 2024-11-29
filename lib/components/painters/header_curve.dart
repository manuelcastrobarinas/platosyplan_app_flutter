import 'package:flutter/material.dart';

class HeaderCurve extends StatelessWidget {
  const HeaderCurve({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width : double.infinity,
      child : CustomPaint(
        painter: _HeaderCurvePainter(context: context),
      ) ,
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  final BuildContext context;
  _HeaderCurvePainter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path  = Path();

    paint.color = Theme.of(context).secondaryHeaderColor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.6, size.width, size.height * 0.5); //esto recibe primero las coordenadas de la curva y despues las coordenadas del punto al que quiere llegar
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}