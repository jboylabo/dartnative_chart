import 'package:dartnative/canvas.dart' as ui;
import 'package:dartnative/dartnative.dart';

/// Paints one vertical bar per entry in [values], each bar's height
/// normalized against the largest value.
///
/// [backgroundColor] (typically translucent) draws a rounded "glass" panel
/// behind the chart. [barGradientColors] (2+ colors, bottom to top) fills
/// each bar with a gradient instead of the flat default color.
class VerticalBarChartPainter extends CustomPainter {
  const VerticalBarChartPainter(
    this.values, {
    this.backgroundColor,
    this.barGradientColors,
  });
  final List<double> values;
  final Color? backgroundColor;
  final List<Color>? barGradientColors;

  @override
  void paint(Canvas canvas, Size size) {
    if (backgroundColor != null) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          16,
        ),
        Paint(color: backgroundColor!),
      );
    }

    final maximum = values.reduce((a, b) => a > b ? a : b);
    final slot = size.width / values.length;
    final gradientColors = barGradientColors;
    for (var index = 0; index < values.length; index++) {
      final height = values[index] / maximum * size.height;
      final left = slot * index + slot * 0.2;
      final barRect = Rect.fromLTWH(
        left,
        size.height - height,
        slot * 0.6,
        height,
      );
      final paint = gradientColors != null && gradientColors.length >= 2
          ? Paint(
              shader: ui.Gradient.linear(
                Offset(0, size.height),
                Offset(0, size.height - height),
                gradientColors,
              ),
            )
          : Paint(color: const Color(0xFF6C55B5));
      canvas.drawRect(barRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant VerticalBarChartPainter oldDelegate) => false;
}
