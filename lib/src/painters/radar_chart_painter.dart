import 'dart:math' as math;

import 'package:dartnative/dartnative.dart';

import '../models/radar_series.dart';

/// Paints a radar (spider) chart: one polygon per [series], overlaid on a
/// shared set of [axisLabels], each scaled against the largest value present
/// across every series.
class RadarChartPainter extends CustomPainter {
  RadarChartPainter(this.axisLabels, this.series, {this.fillOpacity = 0.25})
    : assert(
        axisLabels.length >= 3,
        'RadarChartPainter needs at least 3 axes',
      ),
      assert(
        series.every((s) => s.values.length == axisLabels.length),
        'Every RadarSeries needs exactly one value per axis',
      );

  final List<String> axisLabels;
  final List<RadarSeries> series;
  final double fillOpacity;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 24;
    final axisCount = axisLabels.length;

    final maximum = series
        .expand((s) => s.values)
        .fold<double>(0, (max, value) => value > max ? value : max);
    final safeMaximum = maximum <= 0 ? 1.0 : maximum;

    Offset pointFor(int axisIndex, double value) {
      final angle = -math.pi / 2 + 2 * math.pi * axisIndex / axisCount;
      final r = value / safeMaximum * radius;
      return Offset(center.dx + r * math.cos(angle), center.dy + r * math.sin(angle));
    }

    // Grid: 4 concentric rings.
    final gridPaint = Paint(
      color: const Color(0xFFE2E2DD),
      style: PaintingStyle.stroke,
      strokeWidth: 1,
    );
    for (var ring = 1; ring <= 4; ring++) {
      final ringPath = Path();
      final ringValue = safeMaximum * ring / 4;
      for (var i = 0; i < axisCount; i++) {
        final point = pointFor(i, ringValue);
        i == 0 ? ringPath.moveTo(point.dx, point.dy) : ringPath.lineTo(point.dx, point.dy);
      }
      ringPath.close();
      canvas.drawPath(ringPath, gridPaint);
    }

    // Spokes + axis labels.
    for (var i = 0; i < axisCount; i++) {
      final outer = pointFor(i, safeMaximum);
      canvas.drawLine(center, outer, gridPaint);

      final angle = -math.pi / 2 + 2 * math.pi * i / axisCount;
      final labelAnchor = Offset(
        center.dx + (radius + 12) * math.cos(angle),
        center.dy + (radius + 12) * math.sin(angle),
      );
      canvas.drawText(
        axisLabels[i],
        labelAnchor,
        fontSize: 11,
        color: const Color(0xFF767670),
      );
    }

    // One filled + stroked polygon per series.
    for (final entry in series) {
      final path = Path();
      for (var i = 0; i < axisCount; i++) {
        final point = pointFor(i, entry.values[i]);
        i == 0 ? path.moveTo(point.dx, point.dy) : path.lineTo(point.dx, point.dy);
      }
      path.close();
      canvas.drawPath(path, Paint(color: entry.color.withOpacity(fillOpacity)));
      canvas.drawPath(
        path,
        Paint(
          color: entry.color,
          style: PaintingStyle.stroke,
          strokeWidth: 2,
          strokeJoin: StrokeJoin.round,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant RadarChartPainter oldDelegate) => false;
}
