# chart_kit

Reusable **line**, **vertical bar**, **pie**, and **horizontal bar** chart
painters for [DartNative](https://dartnative.com) apps — built entirely with
`CustomPaint`/`CustomPainter`/`Canvas`, no third-party chart package
required.

Each painter takes a plain `List<double>` of values, so it drops into any
`CustomPaint` you already have.

## Screenshots

| Line | Vertical bar |
| --- | --- |
| ![Line chart](screenshot/line.png) | ![Vertical bar chart](screenshot/vertical.png) |

| Pie | Horizontal bar |
| --- | --- |
| ![Pie chart](screenshot/pie.png) | ![Horizontal bar chart](screenshot/bar.png) |

## Install

Add a dependency on `chart_kit` in your app's `pubspec.yaml`. Once published
to [dartpub.dev](https://dartpub.dev), a plain version dependency resolves it
the same way the DartNative framework itself does:

```yaml
dependencies:
  chart_kit: ^0.1.0
```

Then fetch it with:

```sh
dn pub get
```

## Usage

```dart
import 'package:chart_kit/chart_kit.dart';

CustomPaint(
  size: const Size(320, 240),
  painter: const LineChartPainter([18, 30, 24, 42, 38]),
)
```

The other three painters take the same shape of input:

```dart
CustomPaint(painter: const VerticalBarChartPainter([28, 46, 34, 62]));
CustomPaint(painter: const PieChartPainter([45, 30, 25]));
CustomPaint(painter: const HorizontalBarChartPainter([88, 64, 48, 32]));
```

## Public API

- `LineChartPainter(List<double> values)` — connects values left to right
  with a light horizontal grid behind it.
- `VerticalBarChartPainter(List<double> values)` — one bar per value,
  height normalized against the largest value.
- `PieChartPainter(List<double> values)` — donut-style pie chart, each value
  rendered as a proportional arc slice.
- `HorizontalBarChartPainter(List<double> values)` — one bar per value
  against a track background, width normalized against the largest value.

Colors, spacing, and stroke width are fixed in each painter — data is the
only thing you pass in. If a chart's data changes over time, wrap it in a
`StatefulWidget` and rebuild with a new painter instance.

## Example

See [`example/`](example) for a full showcase app that switches between all
four charts. Run it with:

```sh
cd example
dn pub get
dn run
```

## License

MIT — see [LICENSE](LICENSE).
