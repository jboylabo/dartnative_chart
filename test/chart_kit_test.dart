import 'package:chart_kit/chart_kit.dart';
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
  });
}
