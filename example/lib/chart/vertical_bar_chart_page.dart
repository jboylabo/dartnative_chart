import 'package:chart_kit/chart_kit.dart';
import 'package:dartnative/dartnative.dart';

class VerticalBarChartPage extends StatelessWidget {
  const VerticalBarChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Vertical Bar Chart', style: _titleStyle),
      const SizedBox(height: 8),
      const Text('Orders by day of week', style: _descriptionStyle),
      const SizedBox(height: 32),
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width - 40, 240),
        painter: const VerticalBarChartPainter([28, 46, 34, 62, 52, 74, 58]),
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
