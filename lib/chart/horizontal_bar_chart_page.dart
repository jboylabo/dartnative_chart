import 'package:dartnative/dartnative.dart';

class HorizontalBarChartPage extends StatelessWidget {
  const HorizontalBarChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('横棒グラフ', style: _titleStyle),
      const SizedBox(height: 8),
      const Text('商品別の販売数', style: _descriptionStyle),
      const SizedBox(height: 32),
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width - 40, 240),
        painter: const HorizontalBarChartPainter([88, 64, 48, 32]),
      ),
    ],
  );
}

class HorizontalBarChartPainter extends CustomPainter {
  const HorizontalBarChartPainter(this.values);
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    final maximum = values.reduce((a, b) => a > b ? a : b);
    final slot = size.height / values.length;
    final background = Paint(color: const Color(0xFFE5E5E0));
    final foreground = Paint(color: const Color(0xFFE4A34C));
    for (var index = 0; index < values.length; index++) {
      final top = slot * index + slot * 0.2;
      final height = slot * 0.6;
      canvas.drawRect(Rect.fromLTWH(0, top, size.width, height), background);
      canvas.drawRect(
        Rect.fromLTWH(0, top, size.width * values[index] / maximum, height),
        foreground,
      );
    }
  }

  @override
  bool shouldRepaint(covariant HorizontalBarChartPainter oldDelegate) => false;
}

const _titleStyle = TextStyle(
  color: Color(0xFF20201E),
  fontSize: 26,
  fontWeight: FontWeight.w800,
);
const _descriptionStyle = TextStyle(color: Color(0xFF767670), fontSize: 14);
