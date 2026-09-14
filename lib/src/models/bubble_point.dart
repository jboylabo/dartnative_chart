/// One bubble on a [BubbleChartPainter]: a position ([x], [y]) plus a
/// magnitude ([size]) mapped to the drawn radius.
class BubblePoint {
  const BubblePoint({required this.x, required this.y, required this.size});

  final double x;
  final double y;
  final double size;
}
