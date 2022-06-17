import 'package:flutter/material.dart';
import 'package:student_fitness/util/images.dart';
import 'package:get/get.dart';

class BgWidget extends StatefulWidget {
  final Widget child;
  const BgWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<BgWidget> createState() => _BgWidgetState();
}

class _BgWidgetState extends State<BgWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height, width: context.width,
      decoration: Get.isDarkMode ? null : const BoxDecoration(image: DecorationImage(image: AssetImage(Images.bg), fit: BoxFit.fill)),
      child: widget.child,
    );
  }
}
