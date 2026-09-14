import 'package:dartnative/dartnative.dart';

/// Paints a donut-style pie chart, with each entry in [values] rendered as
/// a proportional arc slice.
class PieChartPainter extends CustomPainter {
  const PieChartPainter(this.values);
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    const colors = [Color(0xFF265D4B), Color(0xFF6C55B5), Color(0xFFE4A34C)];
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final total = values.reduce((a, b) => a + b);
    var startAngle = -1.5708;
    for (var index = 0; index < values.length; index++) {
      final sweepAngle = values[index] / total * 6.2832;
      canvas.drawArc(
        rect,
        startAngle,
        sweepAngle,
        true,
        Paint(color: colors[index]),
      );
      startAngle += sweepAngle;
    }
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.25,
      Paint(color: const Color(0xFFF7F7F5)),
    );
  }

  @override
  bool shouldRepaint(covariant PieChartPainter oldDelegate) => false;
}
