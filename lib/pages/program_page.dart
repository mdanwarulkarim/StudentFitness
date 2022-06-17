import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/bg_widget.dart';

class ProgramPage extends StatefulWidget {
  final bool isWorkout;
  const ProgramPage({Key? key, required this.isWorkout}) : super(key: key);

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: widget.isWorkout ? 'Workout Programs' : 'Diet Plans'),
      body: BgWidget(child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(children: [

          const SizedBox(height: 20),

          InkWell(
            onTap: () => Get.toNamed(Routes.getProgramIntroRoute(widget.isWorkout, true)),
            child: Container(
              height: 100, alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xFFEF5DA8), Color(0xFF92A3FD)],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                ),
              ),
              child: Text('Muscle Gain', style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 50),

          InkWell(
            onTap: () => Get.toNamed(Routes.getProgramIntroRoute(widget.isWorkout, false)),
            child: Container(
              height: 100, alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xFFEF5DA8), Color(0xFF9DCEFF)],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                ),
              ),
              child: Text('Fat loss', style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white)),
            ),
          ),

        ]),
      )),
    );
  }
}
