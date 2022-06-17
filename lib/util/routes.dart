import 'dart:convert';

import 'package:get/get.dart';
import 'package:student_fitness/model/program_model.dart';
import 'package:student_fitness/model/user_model.dart';
import 'package:student_fitness/pages/bmi_calculator_page.dart';
import 'package:student_fitness/pages/bottom_nav_page.dart';
import 'package:student_fitness/pages/forget_page.dart';
import 'package:student_fitness/pages/goal_page.dart';
import 'package:student_fitness/pages/info_page.dart';
import 'package:student_fitness/pages/notification_page.dart';
import 'package:student_fitness/pages/on_boarding_page.dart';
import 'package:student_fitness/pages/profile_edit_page.dart';
import 'package:student_fitness/pages/program_details_page.dart';
import 'package:student_fitness/pages/program_intro_page.dart';
import 'package:student_fitness/pages/program_page.dart';
import 'package:student_fitness/pages/settings_page.dart';
import 'package:student_fitness/pages/sign_in_page.dart';
import 'package:student_fitness/pages/sign_up_page.dart';
import 'package:student_fitness/pages/splash_page.dart';
import 'package:student_fitness/pages/track_page.dart';
import 'package:student_fitness/pages/welcome_page.dart';

class Routes {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String onBoarding = '/on-boarding';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String welcome = '/welcome';
  static const String profileEdit = '/profile-edit';
  static const String goal = '/goal';
  static const String bmiCalculator = '/bmi-calculator';
  static const String contactUs = '/contact-us';
  static const String privacyPolicy = '/privacy-policy';
  static const String settings = '/settings';
  static const String notification = '/notification';
  static const String trackProgress = '/track-progress';
  static const String program = '/program';
  static const String programIntro = '/program-intro';
  static const String programDetails = '/program-details';
  static const String forget = '/forget';

  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getOnBoardingRoute() => onBoarding;
  static String getSignInRoute() => signIn;
  static String getSignUpRoute() => signUp;
  static String getProfileEditRoute(UserModel user, bool fromProfile) {
    String _data = base64Url.encode(utf8.encode(jsonEncode(user.toJson(false))));
    return '$profileEdit?user=$_data&page=${fromProfile ? 'profile' : 'signup'}';
  }
  static String getGoalRoute(UserModel user) {
    String _data = base64Url.encode(utf8.encode(jsonEncode(user.toJson(false))));
    return '$goal?user=$_data';
  }
  static String getWelcomeRoute(UserModel user) {
    String _data = base64Url.encode(utf8.encode(jsonEncode(user.toJson(false))));
    return '$welcome?user=$_data';
  }
  static String getBmiCalculatorRoute() => bmiCalculator;
  static String getContactUsRoute() => contactUs;
  static String getPrivacyPolicyRoute() => privacyPolicy;
  static String getSettingsRoute() => settings;
  static String getNotificationRoute() => notification;
  static String getTrackProgressRoute() => trackProgress;
  static String getProgramRoute(bool isWorkout) => '$program?program=${isWorkout ? 'workout' : 'diet'}';
  static String getProgramIntroRoute(bool isWorkout, bool isMuscleGain) {
    return '$programIntro?program=${isWorkout ? 'workout' : 'diet'}&intro=${isMuscleGain ? 'muscle' : 'fat'}';
  }
  static String getProgramDetailsRoute(ProgramModel programModel, int index) {
    String _data = base64Url.encode(utf8.encode(jsonEncode(programModel.toJson())));
    return '$programDetails?program=$_data&index=$index';
  }
  static String getForgetRoute() => forget;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const BottomNavPage()),
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: onBoarding, page: () => const OnBoardingPage()),
    GetPage(name: signIn, page: () => const SignInPage()),
    GetPage(name: signUp, page: () => const SignUpPage()),
    GetPage(name: profileEdit, page: () {
      UserModel _data = UserModel.fromJson(
        jsonDecode(utf8.decode(base64Decode(Get.parameters['user']!.replaceAll(' ', '+')))), false,
      );
      return ProfileEditPage(user: _data, fromProfile: Get.parameters['page'] == 'profile');
    }),
    GetPage(name: goal, page: () {
      UserModel _data = UserModel.fromJson(
        jsonDecode(utf8.decode(base64Decode(Get.parameters['user']!.replaceAll(' ', '+')))), false,
      );
      return GoalPage(user: _data);
    }),
    GetPage(name: welcome, page: () {
      UserModel _data = UserModel.fromJson(
        jsonDecode(utf8.decode(base64Decode(Get.parameters['user']!.replaceAll(' ', '+')))), false,
      );
      return WelcomePage(user: _data);
    }),
    GetPage(name: bmiCalculator, page: () => const BmiCalculatorPage()),
    GetPage(name: contactUs, page: () => const InfoPage(isContactUs: true)),
    GetPage(name: privacyPolicy, page: () => const InfoPage(isContactUs: false)),
    GetPage(name: settings, page: () => const SettingsPage()),
    GetPage(name: notification, page: () => const NotificationPage()),
    GetPage(name: trackProgress, page: () => const TrackPage()),
    GetPage(name: program, page: () => ProgramPage(isWorkout: Get.parameters['program'] == 'workout')),
    GetPage(name: programIntro, page: () => ProgramIntroPage(
      isWorkout: Get.parameters['program'] == 'workout', isMuscleGain: Get.parameters['intro'] == 'muscle',
    )),
    GetPage(name: programDetails, page: () {
      ProgramModel _program = ProgramModel.fromJson(
        jsonDecode(utf8.decode(base64Decode(Get.parameters['program']!.replaceAll(' ', '+')))),
      );
      return ProgramDetailsPage(
        programModel: _program, selectionIndex: int.parse(Get.parameters['index']!),
      );
    }),
    GetPage(name: forget, page: () => const ForgetPage()),
  ];
}