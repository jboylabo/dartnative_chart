import 'package:chart_kit/chart_kit.dart';
import 'package:dartnative/dartnative.dart';

class BubbleChartPage extends StatelessWidget {
  const BubbleChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Bubble Chart', style: _titleStyle),
      const SizedBox(height: 8),
      const Text(
        'Revenue (x), growth (y), and headcount (size) by team',
        style: _descriptionStyle,
      ),
      const SizedBox(height: 32),
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width - 40, 240),
        painter: const BubbleChartPainter([
          BubblePoint(x: 12, y: 18, size: 8),
          BubblePoint(x: 28, y: 42, size: 22),
          BubblePoint(x: 45, y: 25, size: 14),
          BubblePoint(x: 60, y: 60, size: 30),
          BubblePoint(x: 75, y: 35, size: 18),
          BubblePoint(x: 88, y: 70, size: 10),
        ]),
      ),
    ],
  );
}

const _titleStyle = TextStyle(
  color: Color(0xFF20201E),
  fontSize: 26,
  fontWeight: FontWeight.w800,
);
const _descriptionStyle = TextStyle(color: Color(0xFF767670), fontSize: 14);
