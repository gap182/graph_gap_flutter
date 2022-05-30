library graph_gap;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

///Widget of bar graphs
class GraphGap extends StatelessWidget {
  const GraphGap({
    Key? key,
    required this.widthGraph,
    required this.horizontalSeparation,
    required this.verticalSize,
    required this.horizontalSize,
    required this.titles,
    required this.values,
    this.baseColor = const Color(0xFFCCCCCC),
    this.graphColor = const Color(0xFF2E5BFF),
    this.textStyle,
  })  : assert(titles.length == values.length),
        super(key: key);

  ///The width of each bar graph
  final double widthGraph;

  ///The horizontal separation between bars
  final double horizontalSeparation;

  ///The total vertical size of the graph, including titles
  final double verticalSize;

  ///The total horizontal size of the graph
  final double horizontalSize;

  ///The titles in the bottom of each bar
  final List<String> titles;

  ///The values to calculate the height of each bar
  final List<double> values;

  ///The color of the bottom line which separates the bar from the title
  final Color baseColor;

  ///The color of the bottom line which separates the bar from the title
  final Color graphColor;

  ///The style of the titles
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final maxValue = _getMaxValue();
    return Container(
      height: verticalSize,
      width: horizontalSize,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            titles.length,
            (index) => _Graph(
              verticalSize: verticalSize,
              widthGraph: widthGraph,
              horizontalSeparation: horizontalSeparation,
              baseColor: baseColor,
              graphColor: graphColor,
              title: titles[index],
              maxValue: maxValue,
              value: values[index],
              textStyle: textStyle,
            ),
          ),
        ),
      ),
    );
  }

  ///Get the max value to calculate the height of each bar
  double _getMaxValue() {
    return values.reduce(max);
  }
}

class _Graph extends StatelessWidget {
  const _Graph({
    Key? key,
    required this.verticalSize,
    required this.widthGraph,
    required this.horizontalSeparation,
    required this.baseColor,
    required this.graphColor,
    required this.title,
    required this.value,
    required this.maxValue,
    this.textStyle,
  }) : super(key: key);

  final double verticalSize;
  final double widthGraph;
  final double horizontalSeparation;
  final double value;
  final double maxValue;
  final Color baseColor;
  final Color graphColor;
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalSeparation * 0.5),
      height: verticalSize,
      width: widthGraph,
      child: Column(
        children: [
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                const Spacer(),
                Container(
                  height: maxValue == 0
                      ? 0
                      : constraints.maxHeight * (value / maxValue),
                  decoration: BoxDecoration(
                    color: graphColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            );
          })),
          Container(
            height: 2,
            width: widthGraph,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: baseColor,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: verticalSize * 0.1,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
