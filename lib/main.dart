import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/controllers/theme_controller.dart';
import 'package:student_fitness/util/constants.dart';
import 'package:student_fitness/util/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await const MyApp().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? _user = FirebaseAuth.instance.currentUser;
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetMaterialApp(
        title: Constants.name,
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        ),
        theme: themeController.darkTheme ? ThemeData(
          primaryColor: const Color(0xFF7d8ddb),
          secondaryHeaderColor: const Color(0xFFcf5192),
          disabledColor: const Color(0xFFDDDADA),
          shadowColor: const Color(0xFF1e1f1f),
          cardColor: const Color(0xFF000000),
          hintColor: const Color(0xFFADA4A5),
          textTheme: const TextTheme(titleMedium: TextStyle(color: Color(0xFF7B6F72))),
          backgroundColor: const Color(0xFF000000),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF7d8ddb), secondary: Color(0xFFcf5192),
          ),
        ) : ThemeData(
          primaryColor: const Color(0xFF92A3FD),
          secondaryHeaderColor: const Color(0xFFEF5DA8),
          disabledColor: const Color(0xFFDDDADA),
          shadowColor: const Color(0xFFF7F8F8),
          cardColor: const Color(0xFFFFFFFF),
          hintColor: const Color(0xFFADA4A5),
          textTheme: const TextTheme(titleMedium: TextStyle(color: Color(0xFF7B6F72))),
          backgroundColor: const Color(0xFFFFFFFF),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF92A3FD), secondary: Color(0xFFEF5DA8),
          ),
        ),
        initialRoute: _user != null ? Routes.getInitialRoute() : Routes.getSplashRoute(),
        getPages: Routes.routes,
        defaultTransition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500),
      );
    });
  }

  Future<int> init() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(!sharedPreferences.containsKey('theme')) {
      sharedPreferences.setBool('theme', false);
    }
    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => ThemeController(sharedPreferences: sharedPreferences));
    Get.lazyPut(() => AuthController(sharedPreferences: sharedPreferences));
    return 0;
  }
}