import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Notification'),
      body: ListView.builder(
        itemCount: 4,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return Column(children: [

            ListTile(
              leading: Container(
                height: 40, width: 40,
                padding: const EdgeInsets.all(5), alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                ),
                child: Image.asset(Images.work),
              ),
              title: Text('Don’t miss our latest workout program', style: poppinsMedium.copyWith(fontSize: 12)),
              subtitle: Text(
                DateFormat('dd MMM').format(DateTime.now()),
                style: poppinsRegular.copyWith(fontSize: 10, color: Theme.of(context).textTheme.titleMedium!.color),
              ),
              trailing: Icon(Icons.more_vert, color: Theme.of(context).textTheme.titleMedium!.color),
            ),

            Divider(color: Theme.of(context).textTheme.titleMedium!.color, height: 5),

          ]);
        },
      ),
    );
  }
}
