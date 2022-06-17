import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/model/user_model.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColors = [
    const Color(0xffC58BF2),
    const Color(0xffEEA4CE),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: const Color(0xFF909AC6), width: 2),
                color: Theme.of(context).cardColor),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(mainData()),
            ),
          ),
        ),
      ],
    );
  }

  String getMonth(int decrease) {
    return DateFormat('MMM').format(DateTime.now().subtract(Duration(days: 30*decrease)));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text(getMonth(5), style: style);
        break;
      case 3:
        text = Text(getMonth(4), style: style);
        break;
      case 5:
        text = Text(getMonth(3), style: style);
        break;
      case 7:
        text = Text(getMonth(2), style: style);
        break;
      case 9:
        text = Text(getMonth(1), style: style);
        break;
      case 11:
        text = Text(getMonth(0), style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  String generateWeight(int increase) {
    double _weight = Get.find<AuthController>().getUserData()!.weight ?? 50;
    return (_weight + increase).toStringAsFixed(0);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = generateWeight(10);
        break;
      case 3:
        text = generateWeight(0);
        break;
      case 5:
        text = generateWeight(-10);
        break;
      case 7:
        text = generateWeight(-20);
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  double getDotData(int decrease) {
    double _weight = 0;
    double _currentWeight = Get.find<AuthController>().getUserData()!.weight ?? 0;
    DateTime _date = DateTime(
      DateTime.now().subtract(Duration(days: 30*decrease)).year,
      DateTime.now().subtract(Duration(days: 30*decrease)).month,
    );
    for(ProgressModel progress in Get.find<AuthController>().getUserData()!.progress ?? []) {
      DateTime _time = DateTime(progress.date!.year, progress.date!.month);
      if(_date.isAtSameMomentAs(_time)) {
        _weight = progress.weight ?? 0;
        break;
      }
    }
    if(_weight >= _currentWeight+10) {
      return 8;
    }else if(_weight >= _currentWeight) {
      return 6;
    }else if(_weight >= _currentWeight-10) {
      return 4;
    }else if(_weight >= _currentWeight-20) {
      return 2;
    }else {
      return 0;
    }
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 8,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, getDotData(5)),
            FlSpot(2, getDotData(4)),
            FlSpot(4, getDotData(3)),
            FlSpot(8, getDotData(2)),
            FlSpot(10, getDotData(1)),
            FlSpot(12, getDotData(0)),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
