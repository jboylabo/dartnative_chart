import 'package:dartnative/dartnative.dart';

/// Paints one vertical bar per entry in [values], each bar's height
/// normalized against the largest value.
class VerticalBarChartPainter extends CustomPainter {
  const VerticalBarChartPainter(this.values);
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    final maximum = values.reduce((a, b) => a > b ? a : b);
    final slot = size.width / values.length;
    final paint = Paint(color: const Color(0xFF6C55B5));
    for (var index = 0; index < values.length; index++) {
      final height = values[index] / maximum * size.height;
      final left = slot * index + slot * 0.2;
      canvas.drawRect(
        Rect.fromLTWH(left, size.height - height, slot * 0.6, height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant VerticalBarChartPainter oldDelegate) => false;
}
