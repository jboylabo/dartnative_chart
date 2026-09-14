import 'package:dartnative/canvas.dart' as ui;
import 'package:dartnative/dartnative.dart';

import '../models/bubble_point.dart';

const _palette = [
  Color(0xFF265D4B),
  Color(0xFF6C55B5),
  Color(0xFFE4A34C),
  Color(0xFF3E7CB1),
];

/// Paints one circle per [points] entry, positioned by ([BubblePoint.x],
/// [BubblePoint.y]) and sized (between [minRadius] and [maxRadius]) by
/// [BubblePoint.size] — a scatter/bubble chart.
class BubbleChartPainter extends CustomPainter {
  const BubbleChartPainter(
    this.points, {
    this.minRadius = 8,
    this.maxRadius = 36,
  });

  final List<BubblePoint> points;
  final double minRadius;
  final double maxRadius;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final xs = points.map((p) => p.x);
    final ys = points.map((p) => p.y);
    final sizes = points.map((p) => p.size);

    final minX = xs.reduce((a, b) => a < b ? a : b);
    final maxX = xs.reduce((a, b) => a > b ? a : b);
    final minY = ys.reduce((a, b) => a < b ? a : b);
    final maxY = ys.reduce((a, b) => a > b ? a : b);
    final minSize = sizes.reduce((a, b) => a < b ? a : b);
    final maxSize = sizes.reduce((a, b) => a > b ? a : b);

    final xRange = maxX - minX == 0 ? 1.0 : maxX - minX;
    final yRange = maxY - minY == 0 ? 1.0 : maxY - minY;
    final sizeRange = maxSize - minSize == 0 ? 1.0 : maxSize - minSize;

    final inset = maxRadius;
    final plotWidth = size.width - inset * 2;
    final plotHeight = size.height - inset * 2;

    for (var index = 0; index < points.length; index++) {
      final point = points[index];
      final center = Offset(
        inset + (point.x - minX) / xRange * plotWidth,
        size.height -
            inset -
            (point.y - minY) / yRange * plotHeight,
      );
      final radius =
          minRadius + (point.size - minSize) / sizeRange * (maxRadius - minRadius);
      final color = _palette[index % _palette.length];

      canvas.drawCircle(
        center,
        radius,
        Paint(
          shader: ui.Gradient.radial(
            center,
            radius,
            [color.withOpacity(0.85), color.withOpacity(0.35)],
          ),
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant BubbleChartPainter oldDelegate) => false;
}
