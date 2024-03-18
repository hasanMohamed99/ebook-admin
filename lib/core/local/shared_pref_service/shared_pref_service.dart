import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService{
  final SharedPreferences _prefs;

  SharedPrefService(this._prefs);


  void setString({required String key, required String value}) async{
    await _prefs.setString(key, value);
  }

  String? getString({required String key}) {
    return _prefs.getString(key);
  }

  Future<void> remove({required String key}) async{
    await _prefs.remove(key);
  }

  void setBool({required String key, required bool value}) async{
    await _prefs.setBool(key, value);
  }

  bool? getBool({required String key}) {
    return _prefs.getBool(key);
  }

}