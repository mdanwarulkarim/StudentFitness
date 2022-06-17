import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/model/user_model.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/button_widget.dart';

class GoalPage extends StatefulWidget {
  final UserModel? user;
  const GoalPage({Key? key, @required this.user}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  int _currentIndex = 0;
  final List<String> _imageList = [Images.goal_1, Images.goal_2];
  final List<String> _titleList = ['Improve Shape', 'Lose a Fat'];
  final List<String> _descriptionList = [
    'I have a low amount of body fat and need / want to build more muscle',
    'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [

        const SizedBox(height: 30),
        Text('What is your goal ?', style: poppinsBold.copyWith(fontSize: 20)),
        const SizedBox(height: 5),
        Text('It will help us to choose a best program for you', style: poppinsRegular.copyWith(
          fontSize: 12, color: Theme.of(context).hintColor,
        )),
        const SizedBox(height: 50),

        Expanded(child: CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            disableCenter: true,
            autoPlayInterval: const Duration(seconds: 7),
            onPageChanged: (index, reason) {
              _currentIndex = index;
            },
          ),
          itemCount: _imageList.length,
          itemBuilder: (context, index, _) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(_imageList[index], height: context.height*0.35),
                const SizedBox(height: 30),
                Text(_titleList[index], style: poppinsBold.copyWith(color: Colors.white)),
                const SizedBox(height: 10),
                Text(
                  _descriptionList[index], textAlign: TextAlign.center,
                  style: poppinsRegular.copyWith(color: Colors.white, fontSize: 12),
                ),
              ]),
            );
          },
        )),
        const SizedBox(height: 30),

        GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading ? ButtonWidget(
            buttonText: 'Confirm',
            margin: const EdgeInsets.all(30),
            onPressed: () {
              UserModel _user = widget.user!;
              _user.program = _currentIndex == 0 ? 'Workout' : 'Diet';
              authController.updateUserProfile(_user).then((value) => Get.toNamed(Routes.getWelcomeRoute(_user)));
            },
          ) : const Center(child: CircularProgressIndicator());
        }),

      ])),
    );
  }
}
