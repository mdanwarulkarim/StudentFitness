import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/model/program_model.dart';
import 'package:student_fitness/util/constants.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/line_chart_widget.dart';
import 'package:student_fitness/widget/pie_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProgramModel? _fullBodyWorkout;
  ProgramModel? _abWorkout;

  @override
  void initState() {
    super.initState();

    _fullBodyWorkout = ProgramModel(
      header: 'Muscle Gain Freehand Training', programData: [
        ProgramData(title: 'Full body workout', description: '', rounds: [Rounds(title: 'Round 1', description: '1. Jumping Jacks 30\n2. Squats 20\n3. Pushups 10\n\nRest 30 Seconds'), Rounds(title: 'Round 2', description: '1. Mountain Climbers 30\n2. Lunges 20\n3. Pushups 10\n\nRest 30 Seconds'), Rounds(title: 'Round 3', description: '1. Pulsing Squats 30\n2. Burpees 20\n3. Pushups 10\n\nRest 30 Seconds'), Rounds(title: 'Round 4', description: '1. Bicycle Crunches 30\n2. Cross Jacks 20\n3. Pushups 10\n\nRest 30 Seconds')]),
        ProgramData(title: 'Upperbody workout', description: '1. Pike push ups- 3 x 6-10\n\n2. Incline push ups- 3 x 10-12\n\n3. Diamond push ups- 3 x 10-12\n\n4. Wide push ups- 3 x 10\n\n5. Tricep dips- 3 x 8-12\n\n6. Side Plank - 3 x 10-15\n\n7. Bicycle crunch- 3 x 15-20'),
        ProgramData(title: 'Lower body workout', description: '1. Squat- 3 x 10\n\n2. Lunges- 2 x 10 each leg\n\n3. Pistol Squat- 2 x 10 each leg\n\n4. Jumping Squat - 3 x 12\n\n5. Calf raises - 3 x 30'),
      ],
    );
    _abWorkout = ProgramModel(
      header: 'Fat Loss Freehand Training', programData: [
        ProgramData(title: 'Full body HIITz workout', description: '15 sec rest between each set\n&\n30 sec rest after each round\n&\nrepeat each round 2 times', rounds: [Rounds(title: 'Round 1', description: '1. Drop lunge - 30 sec\n2. Push ups-  30 sec\n3. Jack tuck - 30 sec'), Rounds(title: 'Round 2', description: '1. Squat jump- 30 sec\n2. One arm up down- 30 sec\n3. Bicycle crunch - 30 sec'), Rounds(title: 'Round 3', description: '1. Burpees- 30 sec\n2. High Knees- 30 sec\n3. Plank- 45 sec')]),
        ProgramData(title: 'Abs Workout', description: '1. Crunch- 30 sec\n2. Reachers- 30 sec\n3. Scissors- 20 sec\n4. Overhead Crunch- 20 sec\n5. Russian Twist- 20 sec\n6. Plank- 30 sec\n\nNo rest between the sets & repeat this 2/3 times '),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
        title: Text(Constants.name, style: poppinsBold.copyWith(fontSize: 20, color: Theme.of(context).textTheme.bodyText1!.color)),
        actions: [IconButton(
          onPressed: () => Get.toNamed(Routes.getNotificationRoute()),
          icon: Image.asset(Images.notification, width: 20, height: 20),
        )],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Text('Welcome Back,', style: poppinsRegular.copyWith(fontSize: 12)),
          Text(Get.find<AuthController>().getUserData()!.name ?? '', style: poppinsBold.copyWith(fontSize: 20)),
          const SizedBox(height: 30),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor,
              gradient: const LinearGradient(
                colors: [Color(0xFF9DCEFF), Color(0xFF92A3FD)],
                begin: Alignment.bottomLeft, end: Alignment.centerRight,
              ),
              image: const DecorationImage(image: AssetImage(Images.bannerDots)),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('BMI (Body Mass Index)', style: poppinsSemiBold.copyWith(color: Colors.white)),
                const SizedBox(height: 5),
                Text('You have ${bmiStatus(getBmi())}', style: poppinsRegular.copyWith(fontSize: 12, color: Colors.white)),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => Get.toNamed(Routes.getBmiCalculatorRoute()),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Text('View More', style: poppinsSemiBold.copyWith(color: Colors.white)),
                  ),
                ),
              ])),
              SizedBox(height: 100, width: 100, child: PieWidget(bmi: getBmi())),
            ]),
          ),
          const SizedBox(height: 30),

          Text('Personal Progress', style: poppinsSemiBold.copyWith(fontSize: 16)),
          const SizedBox(height: 10),
          const LineChartWidget(),
          const SizedBox(height: 30),

          Text('Latest Workout programs', style: poppinsSemiBold.copyWith(fontSize: 16)),
          const SizedBox(height: 10),
          ListTile(
            onTap: () => Get.toNamed(Routes.getProgramDetailsRoute(_fullBodyWorkout!, 0)),
            leading: Container(
              height: 50, width: 50, alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              child: Image.asset(Images.fullBodyWorkout, height: 40, width: 40),
            ),
            title: Text('Full body Workout', style: poppinsMedium.copyWith(fontSize: 12)),
            trailing: const Icon(Icons.navigate_next),
          ),
          const SizedBox(height: 10),
          ListTile(
            onTap: () => Get.toNamed(Routes.getProgramDetailsRoute(_abWorkout!, 1)),
            leading: Container(
              height: 50, width: 50, alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              child: Image.asset(Images.abWorkout, height: 40, width: 40),
            ),
            title: Text('Ab Workout', style: poppinsMedium.copyWith(fontSize: 12)),
            trailing: const Icon(Icons.navigate_next),
          ),
          const SizedBox(height: 30),

          Text('Read Latest Fitness Article', style: poppinsSemiBold.copyWith(fontSize: 16)),
          const SizedBox(height: 10),
          Container(
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Color(0xFFA4E4F2), Color(0xFFFFFFFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Column(children: [
              Image.asset(Images.article, height: 85),
              const SizedBox(height: 10),
              Text('How student fitness affects brain function', style: poppinsSemiBold.copyWith(fontSize: 10, color: Colors.black)),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => launchUrlString(
                  'https://www.greatschools.org/gk/articles/how-student-fitness-affects-brain-function/',
                  mode: LaunchMode.externalApplication,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF63AAFF),
                  ),
                  child: Text('Click Here', style: poppinsSemiBold.copyWith(color: Colors.white)),
                ),
              ),
            ]),
          ),

        ]),
      ),
    );
  }

  double getBmi() {
    double _weight = Get.find<AuthController>().getUserData()!.weight ?? 0;
    double _height = (Get.find<AuthController>().getUserData()!.height ?? 0) / 100;
    return _weight / (_height * _height);
  }

  String bmiStatus(double bmi) {
    if(bmi < 21) {
      return 'Under Weight';
    }else if(bmi >= 21 && bmi <= 26.4) {
      return 'Healthy';
    }else if(bmi >= 26.4 && bmi <= 27.8) {
      return 'Marinally Over weight';
    }else if(bmi >= 27.8 && bmi <= 31.1) {
      return 'Over Weight';
    }else if(bmi > 31.1) {
      return 'Obese';
    }else {
      return 'Normal Weight';
    }
  }
}
