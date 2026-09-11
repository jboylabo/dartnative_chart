import 'package:dartnative/dartnative.dart';

class VerticalBarChartPage extends StatelessWidget {
  const VerticalBarChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('縦棒グラフ', style: _titleStyle),
      const SizedBox(height: 8),
      const Text('曜日別の注文数', style: _descriptionStyle),
      const SizedBox(height: 32),
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width - 40, 240),
        painter: const VerticalBarChartPainter([28, 46, 34, 62, 52, 74, 58]),
      ),
    ],
  );
}

class VerticalBarChartPainter extends CustomPainter {
  const VerticalBarChartPainter(this.values);
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    final maximum = values.reduce((a, b) => a > b ? a : b);
    final slot = size.width / values.length;
    final paint = Paint(color: const Color(0xFF6C55B5));
    for (var index = 0; index < values.length; index++) {
      final height = values[index] / maximum * size.height;
      final left = slot * index + slot * 0.2;
      canvas.drawRect(
        Rect.fromLTWH(left, size.height - height, slot * 0.6, height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant VerticalBarChartPainter oldDelegate) => false;
}

const _titleStyle = TextStyle(
  color: Color(0xFF20201E),
  fontSize: 26,
  fontWeight: FontWeight.w800,
);
const _descriptionStyle = TextStyle(color: Color(0xFF767670), fontSize: 14);
