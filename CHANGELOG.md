## 0.2.0

* `RadarChartPainter` + `RadarSeries` — multi-series radar/spider chart,
  overlaid translucent polygons across shared axes.
* `BubbleChartPainter` + `BubblePoint` — radial-gradient bubble/scatter
  chart, positioned by `x`/`y` and sized by `size`.
* `LineChartPainter`, `VerticalBarChartPainter`, `HorizontalBarChartPainter`,
  and `PieChartPainter` gain an optional `backgroundColor` (translucent
  "glass" panel behind the chart).
* `LineChartPainter` gains `areaGradientColors`; `VerticalBarChartPainter`
  and `HorizontalBarChartPainter` gain `barGradientColors` — gradient fills
  in place of the flat default color.

## 0.1.0

* Initial release.
* `LineChartPainter`, `VerticalBarChartPainter`, `PieChartPainter`, and
  `HorizontalBarChartPainter` — each a `CustomPainter` taking a
  `List<double>` of values to draw.
