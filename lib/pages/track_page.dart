import 'package:flutter/material.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/bar_chart_widget.dart';
import 'package:student_fitness/widget/bg_widget.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({Key? key}) : super(key: key);

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Track Your Progress'),
      body: BgWidget(child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text('Calories Burn', style: poppinsRegular.copyWith(fontSize: 12, color: Colors.white)),
              const SizedBox(width: 5),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ]),
          ),
          const SizedBox(height: 20),

          const BarChartWidget(),

        ]),
      )),
    );
  }
}
