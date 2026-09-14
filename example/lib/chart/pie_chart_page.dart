import 'package:chart_kit/chart_kit.dart';
import 'package:dartnative/dartnative.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Pie Chart', style: _titleStyle),
      const SizedBox(height: 8),
      const Text('Sales breakdown by category', style: _descriptionStyle),
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

const _titleStyle = TextStyle(
  color: Color(0xFF20201E),
  fontSize: 26,
  fontWeight: FontWeight.w800,
);
const _descriptionStyle = TextStyle(color: Color(0xFF767670), fontSize: 14);
