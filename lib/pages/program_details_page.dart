import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/model/program_model.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/bg_widget.dart';
import 'package:student_fitness/widget/scroll_to_index.dart';

class ProgramDetailsPage extends StatefulWidget {
  final ProgramModel programModel;
  final int selectionIndex;
  const ProgramDetailsPage({Key? key, required this.programModel, required this.selectionIndex}) : super(key: key);

  @override
  State<ProgramDetailsPage> createState() => _ProgramDetailsPageState();
}

class _ProgramDetailsPageState extends State<ProgramDetailsPage> {
  final AutoScrollController _controller = AutoScrollController();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      _controller.scrollToIndex(
        widget.selectionIndex,
        preferPosition: AutoScrollPosition.begin,
        duration: const Duration(seconds: 1),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: widget.programModel.header ?? ''),
      body: BgWidget(child: ListView.builder(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        itemCount: widget.programModel.programData!.length,
        itemBuilder: (context, index) {
          return AutoScrollTag(
            index: index,
            controller: _controller,
            key: ValueKey(index),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                  boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300] ?? Colors.grey, blurRadius: 5, spreadRadius: 1)],
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD97FC2), Color(0xFF92A3FD)],
                        begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      widget.programModel.programData![index].title ?? '',
                      style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  if(widget.programModel.programData![index].rounds != null) ListView.builder(
                    itemCount: widget.programModel.programData![index].rounds!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                          Center(
                            child: Container(
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFDA7CC0), Color(0xFF9DCEFF)],
                                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Text(
                                widget.programModel.programData![index].rounds![i].title ?? '',
                                style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          Text(
                            widget.programModel.programData![index].rounds![i].description ?? '',
                            style: poppinsSemiBold.copyWith(fontSize: 18),
                          ),

                        ]),
                      );
                    },
                  ),

                  Text(
                    widget.programModel.programData![index].description ?? '',
                    style: poppinsSemiBold.copyWith(fontSize: 18),
                  ),

                ]),
              ),
            ),
          );
        },
      )),
    );
  }
}
