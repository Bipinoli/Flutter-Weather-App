import "package:flutter/material.dart";

import '../custom_painter.dart';
import '../graph_utils.dart';

Widget _buildGraphLabels({
  BoxConstraints constraints,
  List<double> dataY,
  List<String> labelImageUrls,
  List<String> labelTexts,
}) {
  List<Offset> locationInCanvas = calculateLocationInCanvas(
      canvasSize: Size(constraints.maxWidth, constraints.maxHeight),
      dataY: dataY);
  return Stack(
    children: [
      ...locationInCanvas.asMap().entries.map((entry) {
        var loc = entry.value;
        var index = entry.key;
        return Positioned(
          left: loc.dx - 20.0,
          top: loc.dy - 80.0,
          child: Column(
            children: [
              Image(
                image: NetworkImage(labelImageUrls[index]),
              ),
              Text(
                "${dataY[index]}°",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      }).toList(),
      ...locationInCanvas.asMap().entries.map((entry) {
        var loc = entry.value;
        var index = entry.key;
        return Positioned(
          left: loc.dx - 14.0,
          top: loc.dy + 10.0,
          child: Text(labelTexts[index],
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              )),
        );
      }).toList(),
    ],
  );
}

Widget buildGraph(
    {List<double> dataY,
    int highlightedIndex,
    List<String> labelImageUrls,
    List<String> labelTexts}) {
  final GraphLinePainter graphLinePainter =
      GraphLinePainter(dataY: dataY, highlightedIndex: highlightedIndex);

  return Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(top: 15.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            painter: graphLinePainter,
            child: _buildGraphLabels(
              constraints: constraints,
              dataY: dataY,
              labelImageUrls: labelImageUrls,
              labelTexts: labelTexts,
            ),
          );
        },
      ),
    ),
  );
}
