import '../../config/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesStore {
  SharedPreferences? _sp;

  Future<SharedPreferences?> _init() async {
    _sp = await SharedPreferences.getInstance();
    return _sp;
  }


  Future<bool?> getFirstSeen() async {
    var sp = await _init();
    return sp?.getBool(AppStrings.firstSeen);
  }

  Future<void> setFirstSeen() async {
    final sp = await _init();
    await sp?.setBool(AppStrings.firstSeen, true);
  }
}