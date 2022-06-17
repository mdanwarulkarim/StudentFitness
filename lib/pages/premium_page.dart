import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/button_widget.dart';
import 'package:student_fitness/widget/plan_card.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Premium', backButton: false),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(children: [

          Text('Get Premium', style: poppinsSemiBold.copyWith(fontSize: 16, color: const Color(0xCF773488))),
          SizedBox(width: 115, child: Divider(thickness: 1, color: Theme.of(context).textTheme.bodyText1!.color)),
          const SizedBox(height: 20),

          const Text('Access to exclusive workouts and diets which will be customised by professional.', style: poppinsMedium),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
              boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300] ?? Colors.grey, blurRadius: 5, spreadRadius: 1)],
            ),
            child: Column(children: [

              Row(children: [
                Image.asset(Images.diamond, width: 20, height: 20),
                const SizedBox(width: 10),
                Text('Get trained by professional', style: poppinsMedium.copyWith(fontSize: 12)),
              ]),
              const SizedBox(height: 20),
              Row(children: [
                Image.asset(Images.diamond, width: 20, height: 20),
                const SizedBox(width: 10),
                Text('Get customised workout programs', style: poppinsMedium.copyWith(fontSize: 12)),
              ]),
              const SizedBox(height: 20),
              Row(children: [
                Image.asset(Images.diamond, width: 20, height: 20),
                const SizedBox(width: 10),
                Text('Get customised diet plans', style: poppinsMedium.copyWith(fontSize: 12)),
              ]),
              const SizedBox(height: 20),
              Row(children: [
                Image.asset(Images.diamond, width: 20, height: 20),
                const SizedBox(width: 10),
                Text('Weekly updates on progress', style: poppinsMedium.copyWith(fontSize: 12)),
              ]),

            ]),
          ),
          const SizedBox(height: 20),

          const PlanCard(title: 'Monthly Subscription', amount: 'RM 29.90', description: 'Billed every month. Cancel any time.'),
          const SizedBox(height: 20),

          const PlanCard(title: 'Yearly Subscription', amount: 'RM 310.90', description: 'Billed every year. Cancel any time.'),
          const SizedBox(height: 30),

          SizedBox(height: 45, child: ButtonWidget(
            width: 180,
            buttonText: 'Purchase',
            onPressed: () {
              launchUrlString('https://www.bankislam.biz/', mode: LaunchMode.externalApplication);
            },
          )),

        ]),
      ),
    );
  }
}
