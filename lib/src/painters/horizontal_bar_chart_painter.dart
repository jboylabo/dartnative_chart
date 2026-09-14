import 'package:dartnative/dartnative.dart';

/// Paints one horizontal bar per entry in [values] against a track
/// background, each bar's width normalized against the largest value.
class HorizontalBarChartPainter extends CustomPainter {
  const HorizontalBarChartPainter(this.values);
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    final maximum = values.reduce((a, b) => a > b ? a : b);
    final slot = size.height / values.length;
    final background = Paint(color: const Color(0xFFE5E5E0));
    final foreground = Paint(color: const Color(0xFFE4A34C));
    for (var index = 0; index < values.length; index++) {
      final top = slot * index + slot * 0.2;
      final height = slot * 0.6;
      canvas.drawRect(Rect.fromLTWH(0, top, size.width, height), background);
      canvas.drawRect(
        Rect.fromLTWH(0, top, size.width * values[index] / maximum, height),
        foreground,
      );
    }
  }

  @override
  bool shouldRepaint(covariant HorizontalBarChartPainter oldDelegate) =>
      false;
}
