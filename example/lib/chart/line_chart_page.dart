import 'package:chart_kit/chart_kit.dart';
import 'package:dartnative/dartnative.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Line Chart', style: _titleStyle),
      const SizedBox(height: 8),
      const Text(
        'Weekly page views — gradient area fill',
        style: _descriptionStyle,
      ),
      const SizedBox(height: 32),
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width - 40, 240),
        painter: const LineChartPainter(
          [18, 30, 24, 42, 38, 55, 62],
          areaGradientColors: [Color(0x662CA57B), Color(0x002CA57B)],
        ),
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
