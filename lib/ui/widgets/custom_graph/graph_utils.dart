import 'dart:math';
import 'dart:ui';

List<Offset> calculateLocationInCanvas({Size canvasSize, List<int> dataY}) {
  List<Offset> retval = <Offset>[];

  final maxValue = dataY.reduce((value, element) => max(value, element));
  final minValue = dataY.reduce((value, element) => min(value, element));
  List<double> _dataFraction =
      dataY.map((e) => (e - minValue) / (maxValue - minValue)).toList();

  final double minWidth = 20.0;
  final double maxWidth = canvasSize.width - 20.0;
  final double minHeight = canvasSize.height * .8;
  final double maxHeight = canvasSize.height * .5;
  final double widthStep = (maxWidth - minWidth) / (_dataFraction.length - 1);

  var xPos = minWidth;
  for (int i = 0; i < _dataFraction.length; i++) {
    double x = xPos;
    double y = minHeight + _dataFraction[i] * (maxHeight - minHeight);
    xPos += widthStep;
    retval.add(Offset(x, y));
  }

  return retval;
}
