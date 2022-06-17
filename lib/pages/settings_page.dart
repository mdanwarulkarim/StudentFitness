import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:student_fitness/controllers/theme_controller.dart';
import 'package:student_fitness/util/constants.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/bg_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Settings'),
      body: BgWidget(child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          InkWell(
            onTap: () {
              Share.share(Constants.name);
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Share with friends', style: poppinsBold),
            ),
          ),

          InkWell(
            onTap: () {
              launchUrlString(
                'mailto:karim247live@gmail.com?subject=[Student%20Fitness]%20Help/Query',
                mode: LaunchMode.externalApplication,
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Help/inquiry', style: poppinsBold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Theme', style: poppinsSemiBold.copyWith(fontSize: 16)),
              const SizedBox(height: 10),
              GetBuilder<ThemeController>(builder: (themeController) {
                return Row(children: [
                  Expanded(child: RadioListTile<bool>(
                    value: false,
                    groupValue: themeController.darkTheme,
                    onChanged: (bool? darkTheme) => themeController.setTheme(false),
                    title: Text('Light Theme', style: poppinsRegular.copyWith(fontSize: 12, color: Theme.of(context).textTheme.titleMedium!.color)),
                  )),
                  Expanded(child: RadioListTile<bool>(
                    value: true,
                    groupValue: themeController.darkTheme,
                    onChanged: (bool? darkTheme) => themeController.setTheme(true),
                    title: Text('Dark Theme', style: poppinsRegular.copyWith(fontSize: 12, color: Theme.of(context).textTheme.titleMedium!.color)),
                  )),
                ]);
              }),
            ]),
          ),

        ]),
      )),
    );
  }
}
