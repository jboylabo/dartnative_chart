import 'package:dartnative/dartnative.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('折れ線グラフ', style: _titleStyle),
      const SizedBox(height: 8),
      const Text('1週間のアクセス数', style: _descriptionStyle),
      const SizedBox(height: 32),
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width - 40, 240),
        painter: const LineChartPainter([18, 30, 24, 42, 38, 55, 62]),
      ),
    ],
  );
}

class LineChartPainter extends CustomPainter {
  const LineChartPainter(this.values);
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
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

const _titleStyle = TextStyle(
  color: Color(0xFF20201E),
  fontSize: 26,
  fontWeight: FontWeight.w800,
);
const _descriptionStyle = TextStyle(color: Color(0xFF767670), fontSize: 14);
