import 'package:dartnative/dartnative.dart';

/// Paints a line chart connecting [values] left to right, normalized to the
/// canvas size with a light horizontal grid behind it.
class LineChartPainter extends CustomPainter {
  const LineChartPainter(this.values);
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint(color: const Color(0xFFE2E2DD), strokeWidth: 1);
    for (var index = 0; index < 4; index++) {
      final y = size.height * index / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }
    final maximum = values.reduce((a, b) => a > b ? a : b);
    final path = Path();
    for (var index = 0; index < values.length; index++) {
      final x = size.width * index / (values.length - 1);
      final y = size.height - values[index] / maximum * size.height;
      index == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }
    canvas.drawPath(
      path,
      Paint(
        color: const Color(0xFF265D4B),
        style: PaintingStyle.stroke,
        strokeWidth: 4,
        strokeCap: StrokeCap.round,
        strokeJoin: StrokeJoin.round,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant LineChartPainter oldDelegate) => false;
}
