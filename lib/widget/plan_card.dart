import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/util/styles.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String amount;
  final String description;
  const PlanCard({Key? key, required this.title, required this.amount, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFefe9f7),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.grey[Get.isDarkMode ? 700 : 400] ?? Colors.grey, blurRadius: 5,
          spreadRadius: 0.5, offset: const Offset(3, 3),
        )],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

        Text(title, style: poppinsSemiBold.copyWith(fontSize: 16)),
        const SizedBox(height: 5),

        Text(amount, style: poppinsBold.copyWith(fontSize: 18)),
        const SizedBox(height: 10),

        Text(description, style: poppinsSemiBold.copyWith(fontSize: 10)),

      ]),
    );
  }
}
