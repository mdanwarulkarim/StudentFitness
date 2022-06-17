import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:student_fitness/util/styles.dart';

class PieWidget extends StatefulWidget {
  final double bmi;
  const PieWidget({Key? key, required this.bmi}) : super(key: key);

  @override
  State<PieWidget> createState() => _PieWidgetState();
}

class _PieWidgetState extends State<PieWidget> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, width: 50,
      child: Column(
        children: <Widget>[
          Expanded(
            child: PieChart(
              PieChartData(
                  startDegreeOffset: 180,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,
                  sections: showingSections()),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
          (i) {

        final color0 = Theme.of(context).secondaryHeaderColor;
        const color1 = Colors.white;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: 25,
              title: widget.bmi.toStringAsFixed(1),
              radius: 50,
              titleStyle: poppinsSemiBold.copyWith(fontSize: 12, color: Colors.white),
              titlePositionPercentageOffset: 0.55,
              borderSide: BorderSide(color: color0.withOpacity(0.4), width: 6),
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: 75,
              title: '',
              radius: 40,
              titlePositionPercentageOffset: 0.55,
              borderSide: BorderSide(color: color1.withOpacity(0.4), width: 6),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
