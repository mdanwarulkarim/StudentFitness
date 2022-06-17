import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/model/user_model.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/button_widget.dart';

class WelcomePage extends StatefulWidget {
  final UserModel? user;
  const WelcomePage({Key? key, @required this.user}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [

          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(Images.success),
            ),
            const SizedBox(height: 30),

            Text(
              'Welcome, ${widget.user!.name}', textAlign: TextAlign.center,
              style: poppinsBold.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              'You are all set now, let’s reach your goals together with us',
              style: poppinsRegular.copyWith(fontSize: 12, color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),

          ])),

          ButtonWidget(
            buttonText: 'Go To Home',
            onPressed: () => Get.offAllNamed(Routes.getInitialRoute()),
          ),

        ]),
      )),
    );
  }
}
