import 'package:dartnative/dartnative.dart';

import 'chart/horizontal_bar_chart_page.dart';
import 'chart/line_chart_page.dart';
import 'chart/pie_chart_page.dart';
import 'chart/vertical_bar_chart_page.dart';
import 'dartnative_plugin_registrant.dart';

void main() {
  DartNativePluginRegistrant.registerAll();
  SystemChrome.defaultStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Color(0xFFF7F7F5),
    systemNavigationBarIconBrightness: Brightness.dark,
  );
  runApp(const ChartSampleApp());
}

class ChartSampleApp extends StatefulWidget {
  const ChartSampleApp({super.key});

  @override
  State<ChartSampleApp> createState() => _ChartSampleAppState();
}

class _ChartSampleAppState extends State<ChartSampleApp> {
  static const labels = ['折れ線', '縦棒', '円', '横棒'];
  static const pages = <Widget>[
    LineChartPage(),
    VerticalBarChartPage(),
    PieChartPage(),
    HorizontalBarChartPage(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFF7F7F5),
    appBar: const AppBar(
      title: Text(
        'Chart Samples',
        style: TextStyle(
          color: Color(0xFF20201E),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    body: Container(
      padding: const EdgeInsets.fromLTRB(20, 76, 20, 32),
      child: Column(
        children: [
          ChartPageSelector(
            labels: labels,
            selectedIndex: selectedIndex,
            onSelected: (index) => setState(() => selectedIndex = index),
          ),
          const SizedBox(height: 28),
          Expanded(child: pages[selectedIndex]),
        ],
      ),
    ),
  );
}

class ChartPageSelector extends StatelessWidget {
  const ChartPageSelector({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(labels.length, (index) {
      final selected = selectedIndex == index;
      return Expanded(
        child: GestureDetector(
          onTap: () => onSelected(index),
          child: Container(
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected
                  ? const Color(0xFF265D4B)
                  : const Color(0xFFE8E8E4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              labels[index],
              style: TextStyle(
                color: selected
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF666660),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
    }),
  );
}
