import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/info_widget.dart';
import 'package:student_fitness/widget/profile_button.dart';
import 'package:student_fitness/widget/progress_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Profile', backButton: false),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: GetBuilder<AuthController>(builder: (authController) {
          return Column(children: [

            Row(children: [
              InkWell(
                onTap: () => authController.updateProfileImage(),
                child: ClipOval(child: authController.getUserData()!.image != null ? FadeInImage.assetNetwork(
                  placeholder: Images.profile, image: authController.getUserData()!.image!, height: 55, width: 55, fit: BoxFit.cover,
                ) : Container(
                  height: 55, width: 55, alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                  child: Image.asset(Images.userGradient),
                )),
              ),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(Get.find<AuthController>().getUserData()!.name ?? '', style: poppinsMedium),
                const SizedBox(height: 5),
                Text('Program - ${Get.find<AuthController>().getUserData()!.program}', style: poppinsRegular.copyWith(fontSize: 12)),
              ])),
              const SizedBox(width: 10),
              InkWell(
                onTap: () => Get.toNamed(Routes.getProfileEditRoute(Get.find<AuthController>().getUserData()!, true)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Text('Edit', style: poppinsSemiBold.copyWith(color: Colors.white)),
                ),
              ),
            ]),
            const SizedBox(height: 20),

            Row(children: [
              Expanded(child: InfoWidget(title: 'Height', value: '${Get.find<AuthController>().getUserData()!.height}cm')),
              const SizedBox(width: 10),
              Expanded(child: InfoWidget(title: 'Weight', value: '${Get.find<AuthController>().getUserData()!.weight}kg')),
              const SizedBox(width: 10),
              Expanded(child: InfoWidget(title: 'Age', value: getAge(Get.find<AuthController>().getUserData()!.dob ?? DateTime.now()))),
            ]),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Account', style: poppinsSemiBold.copyWith(fontSize: 16)),
                const SizedBox(height: 10),
                // ProfileButton(icon: Images.userGradient, title: 'Personal Data', onTap: () {}),
                ProfileButton(icon: Images.trackProgress, title: 'Track your Progress', onTap: () {
                  // Get.toNamed(Routes.getTrackProgressRoute());
                  Get.dialog(const ProgressDialog());
                }),
                ProfileButton(icon: Images.bmi, title: 'BMI Calculator', onTap: () {
                  Get.toNamed(Routes.getBmiCalculatorRoute());
                }),
              ]),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Text('Current Program', style: poppinsSemiBold.copyWith(fontSize: 16)),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.getProgramRoute(true)),
                    child: Column(children: [
                      Image.asset(Images.workout, height: 50),
                      Text('Workout', style: poppinsSemiBold.copyWith(fontSize: 12)),
                    ]),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.getProgramRoute(false)),
                    child: Column(children: [
                      Image.asset(Images.diet, height: 50),
                      Text('Diet', style: poppinsSemiBold.copyWith(fontSize: 12)),
                    ]),
                  ),
                ]),
              ]),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Other', style: poppinsSemiBold.copyWith(fontSize: 16)),
                const SizedBox(height: 10),
                ProfileButton(icon: Images.contactUs, title: 'Contact Us', onTap: () {
                  Get.toNamed(Routes.getContactUsRoute());
                }),
                ProfileButton(icon: Images.privacyPolicy, title: 'Privacy Policy', onTap: () {
                  Get.toNamed(Routes.getPrivacyPolicyRoute());
                }),
                ProfileButton(icon: Images.settings, title: 'Settings', onTap: () {
                  Get.toNamed(Routes.getSettingsRoute());
                }),
                ProfileButton(icon: Images.logout, title: 'Logout', onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.toNamed(Routes.getSignUpRoute());
                }),
              ]),
            ),

          ]);
        }),
      ),
    );
  }

  String getAge(DateTime dob) {
    return '${DateTime.now().difference(dob).inDays~/365}yo';
  }
}
