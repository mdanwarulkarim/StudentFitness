import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/gradient_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFC58BF2), Color(0xFFEF5DA8)],
          ),
        ),
        child: Stack(children: [

          Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(child: Image.asset(Images.logo, height: 60)),
            Center(child: Text('Make Fitness Flexible', style: poppinsRegular.copyWith(fontSize: 18, color: Colors.white))),
          ]),

          Positioned(bottom: 30, left: 30, right: 30, child: InkWell(
            onTap: () => Get.toNamed(Routes.getOnBoardingRoute()),
            child: Container(
              height: 60, alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: GradientText(
                'Get Started',
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFEF5DA8), Color(0xFFC58BF2)],
                ),
                style: poppinsBold.copyWith(fontSize: 16),
              ),
            ),
          )),

        ]),
      ),
    );
  }
}
