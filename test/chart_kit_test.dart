import 'package:chart_kit/chart_kit.dart';
import 'package:dartnative/dartnative.dart';
import 'package:test/test.dart';

void main() {
  group('chart_kit painters', () {
    test('LineChartPainter never requests a repaint', () {
      const painter = LineChartPainter([18, 30, 24, 42]);
      expect(painter.shouldRepaint(painter), isFalse);
    });

    test('VerticalBarChartPainter never requests a repaint', () {
      const painter = VerticalBarChartPainter([28, 46, 34, 62]);
      expect(painter.shouldRepaint(painter), isFalse);
    });

    test('PieChartPainter never requests a repaint', () {
      const painter = PieChartPainter([45, 30, 25]);
      expect(painter.shouldRepaint(painter), isFalse);
    });

    test('HorizontalBarChartPainter never requests a repaint', () {
      const painter = HorizontalBarChartPainter([88, 64, 48, 32]);
      expect(painter.shouldRepaint(painter), isFalse);
    });

    test('RadarChartPainter never requests a repaint', () {
      final painter = RadarChartPainter(
        ['Speed', 'Power', 'Range', 'Comfort', 'Price'],
        [
          const RadarSeries(
            label: 'Model A',
            color: Color(0xFF265D4B),
            values: [70, 60, 85, 55, 40],
          ),
          const RadarSeries(
            label: 'Model B',
            color: Color(0xFF6C55B5),
            values: [50, 80, 60, 75, 65],
          ),
        ],
      );
      expect(painter.shouldRepaint(painter), isFalse);
    });

    test('BubbleChartPainter never requests a repaint', () {
      const painter = BubbleChartPainter([
        BubblePoint(x: 1, y: 2, size: 10),
        BubblePoint(x: 4, y: 6, size: 25),
      ]);
      expect(painter.shouldRepaint(painter), isFalse);
    });

    test('LineChartPainter accepts gradient/background styling', () {
      const painter = LineChartPainter(
        [18, 30, 24, 42],
        backgroundColor: Color(0x11000000),
        areaGradientColors: [Color(0xFF265D4B), Color(0x00265D4B)],
      );
      expect(painter.shouldRepaint(painter), isFalse);
    });

    test('VerticalBarChartPainter accepts gradient/background styling', () {
      const painter = VerticalBarChartPainter(
        [28, 46, 34, 62],
        backgroundColor: Color(0x11000000),
        barGradientColors: [Color(0xFF6C55B5), Color(0xFFB59CF6)],
      );
      expect(painter.shouldRepaint(painter), isFalse);
    });
  });

  group('RadarChartPainter validation', () {
    test('throws when a series has the wrong number of values', () {
      expect(
        () => RadarChartPainter(
          ['A', 'B', 'C'],
          [const RadarSeries(label: 'X', color: Color(0xFF000000), values: [1, 2])],
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
