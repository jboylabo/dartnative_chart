import 'package:dartnative/dartnative.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('円グラフ', style: _titleStyle),
      const SizedBox(height: 8),
      const Text('カテゴリ別の売上構成', style: _descriptionStyle),
      const SizedBox(height: 32),
      Center(
        child: CustomPaint(
          size: const Size(240, 240),
          painter: const PieChartPainter([45, 30, 25]),
        ),
      ),
    ],
  );
}

class PieChartPainter extends CustomPainter {
  const PieChartPainter(this.values);
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    const colors = [Color(0xFF265D4B), Color(0xFF6C55B5), Color(0xFFE4A34C)];
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final total = values.reduce((a, b) => a + b);
    var startAngle = -1.5708;
    for (var index = 0; index < values.length; index++) {
      final sweepAngle = values[index] / total * 6.2832;
      canvas.drawArc(
        rect,
        startAngle,
        sweepAngle,
        true,
        Paint(color: colors[index]),
      );
      startAngle += sweepAngle;
    }
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.25,
      Paint(color: const Color(0xFFF7F7F5)),
    );
  }

  @override
  bool shouldRepaint(covariant PieChartPainter oldDelegate) => false;
}

const _titleStyle = TextStyle(
  color: Color(0xFF20201E),
  fontSize: 26,
  fontWeight: FontWeight.w800,
);
const _descriptionStyle = TextStyle(color: Color(0xFF767670), fontSize: 14);
