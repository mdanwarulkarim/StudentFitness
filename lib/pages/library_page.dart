import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Library', backButton: false),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Text('Workout programs', style: poppinsSemiBold.copyWith(fontSize: 18)),
          SizedBox(width: 175, child: Divider(color: Theme.of(context).textTheme.titleMedium!.color, thickness: 2)),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => Get.toNamed(Routes.getProgramRoute(true)),
            child: Container(
              height: 140, alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xFFC8A0E8), Color(0xFF92A3FD)],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                height: 120, alignment: Alignment.center,
                color: Theme.of(context).cardColor,
                child: Image.asset(Images.workoutProgram, height: 113),
              ),
            ),
          ),
          const SizedBox(height: 50),

          Text('Diet Plans', style: poppinsSemiBold.copyWith(fontSize: 18)),
          SizedBox(width: 95, child: Divider(color: Theme.of(context).textTheme.titleMedium!.color, thickness: 2)),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => Get.toNamed(Routes.getProgramRoute(false)),
            child: Container(
              height: 140, alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xFFC8A0E8), Color(0xFF92A3FD)],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                height: 120, alignment: Alignment.center,
                color: Theme.of(context).cardColor,
                child: Image.asset(Images.diet, height: 113),
              ),
            ),
          ),

        ]),
      ),
    );
  }
}
