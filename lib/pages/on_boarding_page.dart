import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  final List<String> _imageList = [Images.onBoarding_1, Images.onBoarding_2];
  final List<String> _titleList = ['Get  Fit', 'Eat Well'];
  final List<String> _descList = [
    'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
    'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [

        Expanded(child: PageView.builder(
          controller: _pageController,
          itemCount: _imageList.length,
          itemBuilder: (context, index) {
            return Column(children: [

              Expanded(flex: 6, child: Image.asset(_imageList[index], width: context.width, fit: BoxFit.fill)),
              const SizedBox(height: 20),

              Expanded(flex: 4, child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                  Text(_titleList[index], style: poppinsBold.copyWith(fontSize: 24)),
                  const SizedBox(height: 10),

                  Text(
                    _descList[index],
                    style: poppinsRegular,
                  ),

                ]),
              )),

            ]);
          },
          onPageChanged: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        )),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(children: [
            SizedBox(
              height: 60, width: 60,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                value: (_selectedIndex + 1) / _imageList.length,
              ),
            ),
            InkWell(
              onTap: () {
                if (_selectedIndex == _imageList.length - 1) {
                  Get.toNamed(Routes.getSignUpRoute());
                } else {
                  setState(() {
                    _selectedIndex++;
                  });
                  _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                }
              },
              child: Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(top: 5, left: 5),
                decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                child: Icon(
                  _selectedIndex == _imageList.length - 1 ? Icons.check : Icons.navigate_next,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ]),
        ),

      ]),
    );
  }
}
