import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: BarChart(
        mainBarData(),
        swapAnimationDuration: animDuration,
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 40,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          // color: isTouched ? Theme.of(context).secondaryHeaderColor : Theme.of(context).primaryColor,
          width: width,
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Color(0xFFAC8ACC), Color(0xFF774C9E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Theme.of(context).cardColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String date;
              switch (group.x.toInt()) {
                case 0:
                  date = getDate(6);
                  break;
                case 1:
                  date = getDate(5);
                  break;
                case 2:
                  date = getDate(4);
                  break;
                case 3:
                  date = getDate(3);
                  break;
                case 4:
                  date = getDate(2);
                  break;
                case 5:
                  date = getDate(1);
                  break;
                case 6:
                  date = getDate(0);
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                date + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
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
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Theme.of(context).textTheme.bodyText1!.color,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(getWeekday(6, false), style: style);
        break;
      case 1:
        text = Text(getWeekday(5, false), style: style);
        break;
      case 2:
        text = Text(getWeekday(4, false), style: style);
        break;
      case 3:
        text = Text(getWeekday(3, false), style: style);
        break;
      case 4:
        text = Text(getWeekday(2, false), style: style);
        break;
      case 5:
        text = Text(getWeekday(1, false), style: style);
        break;
      case 6:
        text = Text(getWeekday(0, false), style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 16), child: text);
  }

  String getWeekday(int decrease, bool full) {
    return DateFormat(full ? 'EEEE' : 'EEE').format(DateTime.now().subtract(Duration(days: decrease)));
  }

  String getDate(int decrease) {
    return DateFormat('dd MMM').format(DateTime.now().subtract(Duration(days: decrease)));
  }

}
