import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/util/styles.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  const AppbarWidget({Key? key, required this.title, this.backButton = true}) : super(key: key);

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(1000, 50);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.backButton ? InkWell(
        onTap: () => Get.back(),
        child: Center(
          child: Container(
            height: 32, width: 32,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Theme.of(context).shadowColor : const Color(0xFFF7F8F8),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.chevron_left, color: Theme.of(context).textTheme.bodyText1!.color),
          ),
        ),
      ) : null,
      title: Text(
        widget.title,
        style: poppinsBold.copyWith(fontSize: 20, color: Theme.of(context).textTheme.bodyText1!.color),
      ),
      elevation: 0, centerTitle: true, backgroundColor: Theme.of(context).cardColor,
    );
  }
}
