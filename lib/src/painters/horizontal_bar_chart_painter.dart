import 'package:dartnative/canvas.dart' as ui;
import 'package:dartnative/dartnative.dart';

/// Paints one horizontal bar per entry in [values] against a track
/// background, each bar's width normalized against the largest value.
///
/// [backgroundColor] (typically translucent) draws a rounded "glass" panel
/// behind the chart. [barGradientColors] (2+ colors, left to right) fills
/// each bar with a gradient instead of the flat default color.
class HorizontalBarChartPainter extends CustomPainter {
  const HorizontalBarChartPainter(
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
    final slot = size.height / values.length;
    final trackPaint = Paint(color: const Color(0xFFE5E5E0));
    final gradientColors = barGradientColors;
    for (var index = 0; index < values.length; index++) {
      final top = slot * index + slot * 0.2;
      final height = slot * 0.6;
      final width = size.width * values[index] / maximum;
      canvas.drawRect(Rect.fromLTWH(0, top, size.width, height), trackPaint);
      final barPaint = gradientColors != null && gradientColors.length >= 2
          ? Paint(
              shader: ui.Gradient.linear(
                Offset(0, 0),
                Offset(width, 0),
                gradientColors,
              ),
            )
          : Paint(color: const Color(0xFFE4A34C));
      canvas.drawRect(Rect.fromLTWH(0, top, width, height), barPaint);
    }
  }

  @override
  bool shouldRepaint(covariant HorizontalBarChartPainter oldDelegate) =>
      false;
}
