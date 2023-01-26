import 'package:allure_vanguard/presentation/journeys/categories/categories_screen.dart';
import 'package:allure_vanguard/presentation/journeys/favourites/favourites_screen.dart';
import 'package:allure_vanguard/presentation/journeys/home/home_screen.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/palettes.dart';
import '../settings/settings_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int selectBtn = 0;

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  int maxCount = 5;
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavouritesScreen(),
    const SettingsScreen(),
    const Page5(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          // physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
      ),
      extendBody: true,
      bottomNavigationBar:(bottomBarPages.length <= maxCount)
          ?  AnimatedNotchBottomBar(
        pageController: _pageController,
        color: Colors.white,
        showLabel: true,
        notchColor: AppPalette.accentColor,
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home_outlined,
              color: AppPalette.accentColor,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: AppPalette.whiteColor,
            ),
            itemLabel: 'Home',
          ),

          ///svg example
          BottomBarItem(
            inActiveItem: Icon(
              Icons.search,
              color: AppPalette.accentColor,
            ),
            activeItem: Icon(
              Icons.saved_search_rounded,
              color: AppPalette.whiteColor,
            ),
            itemLabel: 'Search',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.bookmark_outline,
              color: AppPalette.accentColor,
            ),
            activeItem: Icon(
              Icons.bookmark,
              color: AppPalette.whiteColor,
            ),
            itemLabel: 'Bookmark',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.settings_outlined,
              color: AppPalette.accentColor,
            ),
            activeItem: Icon(
              Icons.settings,
              color: AppPalette.whiteColor,
            ),
            itemLabel: 'Settings',
          ),
        ],
        onTap: (index) {
          /// control your animation using page controller
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
      )
          : null,

    );
  }
}
class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 4')));
  }
}
