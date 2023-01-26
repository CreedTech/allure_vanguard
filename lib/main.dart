import 'dart:async';

import 'package:allure_vanguard/presentation/article_app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/services.dart';
import 'data/tables/article_table.dart';
import 'di/get_it.dart' as getIt;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ArticleTableAdapter());
  unawaited(getIt.init());


  runApp(ArticleApp());
}




