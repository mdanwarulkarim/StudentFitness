import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/model/program_model.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/bg_widget.dart';
import 'package:student_fitness/widget/intro_button.dart';

class ProgramIntroPage extends StatefulWidget {
  final bool isWorkout;
  final bool isMuscleGain;
  const ProgramIntroPage({Key? key, required this.isWorkout, required this.isMuscleGain}) : super(key: key);

  @override
  State<ProgramIntroPage> createState() => _ProgramIntroPageState();
}

class _ProgramIntroPageState extends State<ProgramIntroPage> {
  ProgramModel? _workoutFreehand;
  ProgramModel? _workoutWeightTraining;
  ProgramModel? _dietPlan1;
  ProgramModel? _dietPlan2;
  ProgramModel? _dietPlan3;

  @override
  void initState() {
    super.initState();

    _workoutFreehand = widget.isMuscleGain ? ProgramModel(
      header: 'Muscle Gain Freehand Training', programData: [
        ProgramData(title: 'Full body workout', description: '', rounds: [Rounds(title: 'Round 1', description: '1. Jumping Jacks 30\n2. Squats 20\n3. Pushups 10\n\nRest 30 Seconds'), Rounds(title: 'Round 2', description: '1. Mountain Climbers 30\n2. Lunges 20\n3. Pushups 10\n\nRest 30 Seconds'), Rounds(title: 'Round 3', description: '1. Pulsing Squats 30\n2. Burpees 20\n3. Pushups 10\n\nRest 30 Seconds'), Rounds(title: 'Round 4', description: '1. Bicycle Crunches 30\n2. Cross Jacks 20\n3. Pushups 10\n\nRest 30 Seconds')]),
        ProgramData(title: 'Upperbody workout', description: '1. Pike push ups- 3 x 6-10\n\n2. Incline push ups- 3 x 10-12\n\n3. Diamond push ups- 3 x 10-12\n\n4. Wide push ups- 3 x 10\n\n5. Tricep dips- 3 x 8-12\n\n6. Side Plank - 3 x 10-15\n\n7. Bicycle crunch- 3 x 15-20'),
        ProgramData(title: 'Lower body workout', description: '1. Squat- 3 x 10\n\n2. Lunges- 2 x 10 each leg\n\n3. Pistol Squat- 2 x 10 each leg\n\n4. Jumping Squat - 3 x 12\n\n5. Calf raises - 3 x 30'),
      ],
    ) : ProgramModel(
      header: 'Fat Loss Freehand Training', programData: [
        ProgramData(title: 'Full body HIITz workout', description: '15 sec rest between each set\n&\n30 sec rest after each round\n&\nrepeat each round 2 times', rounds: [Rounds(title: 'Round 1', description: '1. Drop lunge - 30 sec\n2. Push ups-  30 sec\n3. Jack tuck - 30 sec'), Rounds(title: 'Round 2', description: '1. Squat jump- 30 sec\n2. One arm up down- 30 sec\n3. Bicycle crunch - 30 sec'), Rounds(title: 'Round 3', description: '1. Burpees- 30 sec\n2. High Knees- 30 sec\n3. Plank- 45 sec')]),
        ProgramData(title: 'Abs Workout', description: '1. Crunch- 30 sec\n2. Reachers- 30 sec\n3. Scissors- 20 sec\n4. Overhead Crunch- 20 sec\n5. Russian Twist- 20 sec\n6. Plank- 30 sec\n\nNo rest between the sets & repeat this 2/3 times '),
      ],
    );
    _workoutWeightTraining = widget.isMuscleGain ? ProgramModel(
      header: 'Muscle Gain Weight Training', programData: [
        ProgramData(title: 'Full body workout', description: '1.  Legs: barbell back squats — 5 sets of 5 reps\n\n2. Chest: flat barbell bench press — 5 set of 5 reps\n\n3. Back: seated cable rows — 4 sets of 6–8 reps\n\n4. Shoulders: seated  dumbbell shoulder press — 4 sets of 6–8 reps\n\n5. Triceps: cable rope tricep pushdowns — 3 sets of 8–10 reps\n\n6.  Shoulders: lateral raises — 3 sets of 10–12 reps\n\n7. Calves: seated calf raises — 3 sets of 10–12 reps\n\n8. Abs: planks — 3 sets of 30 second holds'),
        ProgramData(title: 'Push workout', description: '1. Incline Dumbbell Press - 4 sets of  8 reps\n\n2. Seated dumbbell overhead press  3 sets of 8-12 reps\n\n3. Machine Chest Press - 4 sets of   8 reps\n\n4. Overhead Tricep Extensions - 3 sets of 10-15 reps\n\n5. Lateral Raises - 5 sets of  10-20 reps\n\n6. Tricep Pushdowns - 3 sets of 10-15 reps'),
        ProgramData(title: 'Pull workout', description: '1. Lat Pulldown- 3 sets of 8-12 reps\n\n2. Machine Row- 3-4 sets of 8-12 reps\n\n3. Lat Pullover- 2-3 sets of 8-12 reps\n\n4. Reverse Pec Deck- 3 sets of 10-15 reps\n\n5. Bicep Curl- 3-4 sets of 10-15 reps'),
        ProgramData(title: 'Leg workout', description: '1.  Hamstring Curl- 5 sets of  10-15 reps\n\n2. Squat- 5 sets of  8-10 reps\n\n3. Leg press- 5 sets of  8-12 reps\n\n4. Calf Raises- 5 sets of 10-20 reps'),
      ],
    ) : ProgramModel(
      header: 'Fat Loss Weight Training', programData: [
        ProgramData(title: 'Full body workout', description: '1.  Legs: barbell back squats — 5 sets of 5 reps\n\n2. Chest: flat barbell bench press — 5 set of 5 reps\n\n3. Back: seated cable rows — 4 sets of 6–8 reps\n\n4. Shoulders: seated  dumbbell shoulder press — 4 sets of 6–8 reps\n\n5. Triceps: cable rope tricep pushdowns — 3 sets of 8–10 reps\n\n6.  Shoulders: lateral raises — 3 sets of 10–12 reps\n\n7. Calves: seated calf raises — 3 sets of 10–12 reps\n\n8. Abs: planks — 3 sets of 30 second holds'),
        ProgramData(title: 'Upper body workout', description: '1. Incline Dumbbell Press - 4 sets of  8 reps\n\n2. Seated dumbbell overhead press  3 sets of 8-12 reps\n\n3. Machine Chest Press - 4 sets of   8 reps\n\n4. Overhead Tricep Extensions - 3 sets of 10-15 reps\n\n5. Lateral Raises - 5 sets of  10-20 reps\n\n6. Tricep Pushdowns - 3 sets of 10-15 reps'),
        ProgramData(title: 'Lower body  workout', description: '1.  Hamstring Curl- 5 sets of  10-15 reps\n\n2. Squat- 5 sets of  8-10 reps\n\n3. Leg press- 5 sets of  8-12 reps\n\n4. Calf Raises- 5 sets of 10-20 reps'),
      ],
    );

    _dietPlan1 = widget.isMuscleGain ? ProgramModel(
      header: 'Muscle Gain diet plan 1', programData: [
        ProgramData(title: 'Breakfast', description: 'Option 1\n4 slices bread, 2tbs peanut butter, 1 banana\n50gm oatmeal, 300ml milk, 1 banana\n600-700\n\nOption 2\n50gm oatmeal, 300ml milk, 1 banana\n\nCalories\n600-700\n\n\nMeal 2\n\nOption 1\nAny kind of fruits\n\nOption 2\n150-200\n\nCalories\nN/A'),
        ProgramData(title: 'Lunch', description: 'Meal 3\n\nOption 1\n300gm rice, 200gm chicken, any types of vegetable\n\nOption 2\n3 roti chanai, 200gm of chicken, vegetables\n\nCalories\n500-600'),
        ProgramData(title: 'Snack Time', description: 'Meal 4\n\nOption 1\n2 slices bread with 1tbs peanut butter\n\nOption 2\nnoodles with egg\n\nCalories\n250-350'),
        ProgramData(title: 'Dinner', description: 'Meal 5\n\nOption 1\n1 piece naan roti with chicken tandori, salad\n\nOption 2\n200gm rice with 200gm of fish, add any vegetables\n\nCalories\n500-600'),
      ],
    ) : ProgramModel(
      header: 'Fat Loss diet plan 1', programData: [
        ProgramData(title: 'Breakfast', description: '1 medium bowl mee hoon soup (1 cup of mee hoon) + 1/2 cup mustard + shredded chicken\n1 cup low fat milk\n1 slice of wholemeal bread\n1 glass of plain water'),
        ProgramData(title: 'Lunch', description: '1 cup rice / 2 cups porridge\n1/2 cup stir fried spinach\n1/2 cup salad/ulam\n1 piece fish indian curry ( without coconut milk & less oil)\n1 medium papaya\n1 glass plain water\n1 medium orange'),
        ProgramData(title: 'Dinner', description: '1 slice of chapatti\n1/2 cup (dhal + long bean + potato)\n1 piece chicken tandoori\n1 glass plain water\n1 bowl tomyam ( 1 chicken  ) + 1/2 cup (cauliflower + carrot + celery + tomato )'),
      ],
    );
    _dietPlan2 = widget.isMuscleGain ? ProgramModel(
      header: 'Muscle Gain diet plan 2', programData: [
        ProgramData(title: 'Breakfast', description: 'Meal 1\n\n2 egg and cheese breakfast sandwiches (75.1g carbs, 18.3g fat, 38.9g protein and 617 calories)\nOption 1\n1 medium bagel with 2 tbsp. reduced-fat peanut butter\n\nOption 2\n6 egg whites cooked with 1 yolk\n\nCalories\n600-750\n\n\nMeal 2\n\nOption 1\nAny kind of fruits\n\nOption 2\nN/A\n\nCalories\n150-200'),
        ProgramData(title: 'Lunch', description: 'Meal 3\n\n\nOption 1\n1 cup brown long-grain rice (cooked amount)\n1 cup green veggies\n6 oz. chicken breast\n\nOption 2\n1 cup green veggies\n6 oz. lean steak\nLarge baked potato with skin (3-4″ in diameter)\n\nCalories\n500-600'),
        ProgramData(title: 'Snack Time', description: 'Meal 4\n\n\nOption 1\n2 slices bread with 1tbs peanut butter\n\nOption 2\n2 cups of nonfat yogurt (17.3g carbs, 1.9g fat, 48.9g protein and 283.2 calories)\n\nCalories\n250-350'),
        ProgramData(title: 'Dinner', description: 'Meal 5\n\n\nOption 1\n2 servings of fried eggs and ham sandwich (55.8g carbs, 36.6g fat, 62.3g protein and 940 calories\n\nOption 2\n1 apple alongside almond butter and 1 serving of cucumber slices (34.9g carbs, 18.1g fat, 7.9g protein and 307 calories)\n\nCalories\n450-600'),
      ],
    ) : ProgramModel(
      header: 'Fat Loss diet plan 2', programData: [
        ProgramData(title: 'Breakfast', description: '3 egg whites + 1 toasted brown bread + 1/2 cup low fat milk (no sugar)'),
        ProgramData(title: 'Lunch', description: 'One cup of brown rice\nCooked or uncooked vegetables (except potatoes) of your choice without oil\n8 to 12 glasses of water'),
        ProgramData(title: 'Dinner', description: 'One cup of brown rice\nAny vegetables\nAll fruit juices\n1 cucumber'),
      ],
    );
    _dietPlan3 = widget.isMuscleGain ? ProgramModel(header: 'Muscle Gain diet plan 3', programData: []) : ProgramModel(
      header: 'Fat Loss diet plan 3', programData: [
        ProgramData(title: 'Breakfast', description: '1 medium bowl mee hoon soup (1 cup of mee hoon) + 1/2 cup mustard + shredded chicken\n1 cup low fat milk\n1 slice of wholemeal bread\n1 glass of plain water'),
        ProgramData(title: 'Lunch', description: '1 cup rice / 2 cups porridge\n1/2 cup stir fried spinach\n1/2 cup salad/ulam\n1 piece fish indian curry ( without coconut milk & less oil)\n1 medium papaya\n1 glass plain water'),
        ProgramData(title: 'Dinner', description: '1 slice of chapatti\n1/2 cup (dhal + long bean + potato)\n1 piece chicken tandoori\n1 glass plain water\n1 bowl tomyam ( 1 chicken  ) + 1/2 cup (cauliflower + carrot + celery + tomato )'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: '${widget.isMuscleGain ? 'Muscle Gain' : 'Fat Loss'} (${widget.isWorkout ? 'Workout' : 'Diet'})'),
      body: BgWidget(child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: widget.isWorkout ? Column(children: [

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
            child: Text('Freehand workout', style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white)),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300] ?? Colors.grey, blurRadius: 5, spreadRadius: 1)],
            ),
            child: Column(children: [
              IntroButton(title: widget.isMuscleGain ? 'Full body workout' : 'HIIT Full body workout', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_workoutFreehand!, 0));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Upper body workout' : 'Abs workout', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_workoutFreehand!, 1));
              }),
              if(widget.isMuscleGain) IntroButton(title: 'Lower body workout', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_workoutFreehand!, 2));
              }),
            ]),
          ),
          const SizedBox(height: 50),

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
            child: Text('Weight Training', style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white)),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300] ?? Colors.grey, blurRadius: 5, spreadRadius: 1)],
            ),
            child: Column(children: [
              IntroButton(title: widget.isMuscleGain ? 'Full body workout' : 'Full body workout', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_workoutWeightTraining!, 0));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Push workout' : 'Upper body workout', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_workoutWeightTraining!, 1));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Pull workout' : 'Lower body workout', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_workoutWeightTraining!, 2));
              }),
              if(widget.isMuscleGain) IntroButton(title: 'Leg workout', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_workoutWeightTraining!, 3));
              }),
            ]),
          ),

        ]) : Column(children: [

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
              '${widget.isMuscleGain ? 'Muscle Gain' : 'Fat Loss'}  Plan 1',
              style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300] ?? Colors.grey, blurRadius: 5, spreadRadius: 1)],
            ),
            child: Column(children: [
              IntroButton(title: widget.isMuscleGain ? 'Breakfast' : 'Breakfast', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan1!, 0));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Lunch' : 'Lunch', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan1!, 1));
              }),
              if(widget.isMuscleGain) IntroButton(title: 'Snack Time', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan1!, 2));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Dinner' : 'Dinner', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan1!, widget.isMuscleGain ? 3 : 2));
              }),
            ]),
          ),
          const SizedBox(height: 50),

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
              '${widget.isMuscleGain ? 'Muscle Gain' : 'Fat Loss'}  Plan 2',
              style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300] ?? Colors.grey, blurRadius: 5, spreadRadius: 1)],
            ),
            child: Column(children: [
              IntroButton(title: widget.isMuscleGain ? 'Breakfast' : 'Breakfast', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan2!, 0));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Lunch' : 'Lunch', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan2!, 1));
              }),
              if(widget.isMuscleGain) IntroButton(title: 'Snack Time', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan2!, 2));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Dinner' : 'Dinner', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan2!, widget.isMuscleGain ? 3 : 2));
              }),
            ]),
          ),
          SizedBox(height: widget.isMuscleGain ? 0 : 50),

          if(!widget.isMuscleGain) Container(
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
              '${widget.isMuscleGain ? 'Muscle Gain' : 'Fat Loss'}  Plan 3',
              style: poppinsSemiBold.copyWith(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: widget.isMuscleGain ? 0 : 20),

          if(!widget.isMuscleGain) Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300] ?? Colors.grey, blurRadius: 5, spreadRadius: 1)],
            ),
            child: Column(children: [
              IntroButton(title: widget.isMuscleGain ? 'Breakfast' : 'Breakfast', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan3!, 0));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Lunch' : 'Lunch', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan3!, 1));
              }),
              IntroButton(title: widget.isMuscleGain ? 'Dinner' : 'Dinner', onTap: () {
                Get.toNamed(Routes.getProgramDetailsRoute(_dietPlan3!, 2));
              }),
            ]),
          ),

        ]),
      )),
    );
  }
}
