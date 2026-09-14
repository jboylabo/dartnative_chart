import 'package:chart_kit/chart_kit.dart';
import 'package:dartnative/dartnative.dart';

class RadarChartPage extends StatelessWidget {
  const RadarChartPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Radar Chart', style: _titleStyle),
      const SizedBox(height: 8),
      const Text(
        'Two products compared across 5 axes',
        style: _descriptionStyle,
      ),
      const SizedBox(height: 32),
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width - 40, 280),
        painter: RadarChartPainter(
          const ['Speed', 'Power', 'Range', 'Comfort', 'Price'],
          const [
            RadarSeries(
              label: 'Model A',
              color: Color(0xFF265D4B),
              values: [70, 60, 85, 55, 40],
            ),
            RadarSeries(
              label: 'Model B',
              color: Color(0xFF6C55B5),
              values: [50, 80, 60, 75, 65],
            ),
          ],
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
