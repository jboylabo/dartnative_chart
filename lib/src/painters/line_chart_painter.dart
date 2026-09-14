import 'package:dartnative/canvas.dart' as ui;
import 'package:dartnative/dartnative.dart';

/// Paints a line chart connecting [values] left to right, normalized to the
/// canvas size with a light horizontal grid behind it.
///
/// [backgroundColor] (typically a translucent color) draws a rounded "glass"
/// panel behind the chart. [areaGradientColors] (2+ colors, top to bottom)
/// fills the area under the line with a gradient, area-chart style — the
/// line stroke itself stays solid; gradient strokes aren't supported.
class LineChartPainter extends CustomPainter {
  const LineChartPainter(
    this.values, {
    this.backgroundColor,
    this.areaGradientColors,
  });
  final List<double> values;
  final Color? backgroundColor;
  final List<Color>? areaGradientColors;

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

    final gradientColors = areaGradientColors;
    if (gradientColors != null && gradientColors.length >= 2) {
      final areaPath = Path()
        ..moveTo(0, size.height)
        ..lineTo(0, size.height - values[0] / maximum * size.height);
      for (var index = 1; index < values.length; index++) {
        final x = size.width * index / (values.length - 1);
        final y = size.height - values[index] / maximum * size.height;
        areaPath.lineTo(x, y);
      }
      areaPath
        ..lineTo(size.width, size.height)
        ..close();
      canvas.drawPath(
        areaPath,
        Paint(
          shader: ui.Gradient.linear(
            Offset(0, 0),
            Offset(0, size.height),
            gradientColors,
          ),
        ),
      );
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
