import 'package:flutter/material.dart';

class LogoPainterWidget extends StatelessWidget {
  final double size;

  const LogoPainterWidget({super.key, this.size = 64});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _LogoPainter(),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF315B8C)
      ..style = PaintingStyle.fill;

    paint.color = Colors.white;

    final double w = size.width;
    final double h = size.height;

    final Path path = Path();
    
    // Top arch
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.3, h * 0.08, w * 0.4, h * 0.35),
      Radius.circular(w * 0.2),
    ));

    // Main shield/lock body
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.15, h * 0.28, w * 0.7, h * 0.65),
      Radius.circular(w * 0.35),
    ));

    canvas.saveLayer(Rect.fromLTWH(0, 0, w, h), Paint());
    canvas.drawPath(path, paint);

    final erasePaint = Paint()
      ..color = Colors.transparent
      ..blendMode = BlendMode.clear;

    // Center hole (circle)
    canvas.drawCircle(Offset(w * 0.5, h * 0.48), w * 0.14, erasePaint);

    // Bottom cutout (oval)
    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.5, h * 0.78), width: w * 0.38, height: w * 0.35),
      erasePaint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
