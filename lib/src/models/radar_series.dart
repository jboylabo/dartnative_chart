import 'package:dartnative/dartnative.dart';

/// One series (a single overlaid polygon) on a [RadarChartPainter].
///
/// [values] must have exactly one entry per axis, in the same order as the
/// painter's `axisLabels`.
class RadarSeries {
  const RadarSeries({
    required this.label,
    required this.color,
    required this.values,
  });

  final String label;
  final Color color;
  final List<double> values;
}
