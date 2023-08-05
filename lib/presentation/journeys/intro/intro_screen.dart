import 'package:allure_vanguard/presentation/journeys/bookmarks/bookmark_screen.dart';
import 'package:allure_vanguard/presentation/journeys/categories/categories_screen.dart';
import 'package:allure_vanguard/presentation/journeys/favourites/favourites_screen.dart';
import 'package:allure_vanguard/presentation/journeys/home/home_screen.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/palettes.dart';
import '../../blocs/theme/theme_cubit.dart';
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

  int maxCount = 4;
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const BookMarkScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Themes>(
      builder: (context, theme) {
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
          bottomNavigationBar: (bottomBarPages.length <= maxCount)
              ? AnimatedNotchBottomBar(
            itemLabelStyle: TextStyle(
              color: context.read<ThemeCubit>().state == Themes.dark
                  ? AppPalette.whiteColor
                  : AppPalette.accentColor,
              fontSize: 10,
            ),
                  pageController: _pageController,
                  color: context.read<ThemeCubit>().state == Themes.dark
                      ? AppPalette.blackColor
                      : AppPalette.whiteColor,
                  showLabel: true,
                  notchColor: context.read<ThemeCubit>().state == Themes.dark
                      ? AppPalette.whiteColor
                      : AppPalette.accentColor,
                  bottomBarItems: [
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.home_outlined,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? AppPalette.whiteColor
                            : AppPalette.accentColor,
                        // color: AppPalette.accentColor,
                      ),
                      activeItem: Icon(
                        Icons.home_filled,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? AppPalette.accentColor
                            : AppPalette.whiteColor,
                      ),
                      itemLabel: 'Home',
                    ),

                    ///svg example
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.search,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? AppPalette.whiteColor
                            : AppPalette.accentColor,
                      ),
                      activeItem: Icon(
                        Icons.saved_search_rounded,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? AppPalette.accentColor
                            : AppPalette.whiteColor,
                      ),
                      itemLabel: 'Search',
                    ),
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.bookmark_outline,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? AppPalette.whiteColor
                            : AppPalette.accentColor,
                      ),
                      activeItem: Icon(
                        Icons.bookmark,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? AppPalette.accentColor
                            : AppPalette.whiteColor,
                      ),
                      itemLabel: 'Bookmark',
                    ),
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.settings_outlined,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? AppPalette.whiteColor
                            : AppPalette.accentColor,
                      ),
                      activeItem: Icon(
                        Icons.settings,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? AppPalette.accentColor
                            : AppPalette.whiteColor,
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
      },
    );
  }
}
