import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

abstract class ThemeLocalDataSource {
  Future<void> updateTheme(String themeName);
  Future<String> getPreferredTheme();
}

class ThemeLocalDataSourceImpl extends ThemeLocalDataSource {
  @override
  Future<String> getPreferredTheme() async {
    final themeBox = await Hive.openBox('themeBox');
    return themeBox.get('preferred_theme') ?? 'dark';
  }

  @override
  Future<void> updateTheme(String themeName) async {
    final themeBox = await Hive.openBox('themeBox');
    unawaited(themeBox.put('preferred_theme', themeName));
  }
}
