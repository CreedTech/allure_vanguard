import 'package:allure_vanguard/presentation/journeys/categories/categories_screen.dart';
import 'package:allure_vanguard/presentation/journeys/favourites/favourites_screen.dart';
import 'package:allure_vanguard/presentation/journeys/intro/intro_screen.dart';
import 'package:flutter/material.dart';

import '../common/constants/route_constants.dart';
import 'journeys/article_details/article_detail_arguments.dart';
import 'journeys/article_details/article_details_screen.dart';
import 'journeys/home/home_screen.dart';
import 'journeys/settings/settings_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
    RouteList.initial: (context) => IntroScreen(),
    RouteList.home: (context) => HomeScreen(),
    RouteList.category: (context) => CategoriesScreen(),
    RouteList.articleDetail: (context) => ArticleDetailsScreen(
      articleDetailArguments:
      setting.arguments as ArticleDetailArguments,
    ),
    RouteList.favorite: (context) => FavouritesScreen(),
    RouteList.settings: (context) => SettingsScreen(),
  };
}
