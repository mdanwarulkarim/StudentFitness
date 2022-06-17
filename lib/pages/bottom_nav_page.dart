import 'package:flutter/material.dart';
import 'package:student_fitness/pages/home_page.dart';
import 'package:student_fitness/pages/library_page.dart';
import 'package:student_fitness/pages/premium_page.dart';
import 'package:student_fitness/pages/profile_page.dart';
import 'package:student_fitness/util/images.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  PageController? _pageController;
  int _pageIndex = 0;
  List<Widget>? _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _pageIndex = 0;

    _pageController = PageController(initialPage: 0);

    _screens = const [
      HomePage(),
      LibraryPage(),
      PremiumPage(),
      ProfilePage(),
    ];

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,

        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),

          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(children: [
              BottomNavItem(icon: Images.home, isSelected: _pageIndex == 0, onTap: () => _setPage(0)),
              BottomNavItem(icon: Images.library, isSelected: _pageIndex == 1, onTap: () => _setPage(1)),
              BottomNavItem(icon: Images.premium, isSelected: _pageIndex == 2, onTap: () => _setPage(2)),
              BottomNavItem(icon: Images.profile, isSelected: _pageIndex == 3, onTap: () => _setPage(3)),
            ]),
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens![index];
          },
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}

class BottomNavItem extends StatelessWidget {
  final String icon;
  final Function onTap;
  final bool isSelected;
  const BottomNavItem({Key? key, required this.icon, required this.onTap, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Image.asset(icon, color: isSelected ? Theme.of(context).primaryColor : Colors.grey, height: 25, width: 25),
        onPressed: () => onTap(),
      ),
    );
  }
}
