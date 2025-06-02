import 'package:flutter/material.dart';

class DraggableHandle extends StatelessWidget {
  final Widget emoji;
  final double size;
  const DraggableHandle({super.key, required this.emoji, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        emoji,
        CustomPaint(size: Size(size, 8), painter: _PointerPainter()),
      ],
    );
  }
}

class _PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey[400]!
          ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(size.width / 2 - 8, 0);
    path.lineTo(size.width / 2 + 8, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
