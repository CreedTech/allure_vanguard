import 'package:allure_vanguard/config/constants/assets.dart';

class NavModel {
  final int id;
  final String imagePath;
  final String name;

  NavModel({
    required this.id,
    required this.imagePath,
    required this.name,
  });
}

List<NavModel> navBtn = [
  NavModel(id: 0, imagePath: AppIcons.homeIcon, name: 'Home'),
  NavModel(id: 1, imagePath: AppIcons.searchIcon, name: 'Search'),
  NavModel(id: 2, imagePath: AppIcons.heartIcon, name: 'Like'),
  NavModel(id: 3, imagePath: AppIcons.notificationIcon, name: 'notification'),
  NavModel(id: 4, imagePath: AppIcons.userIcon, name: 'Profile'),
];