// ignore_for_file: prefer_const_declarations, unused_field

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService extends GetxService {
  static late SharedPreferences _preferences;

  static final _keyUsername = 'username';
  static final _keylistUser = 'listUser';
  static final _keylistTask = 'listTask';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static Future clear() async {
    _preferences.clear();
  }

  static Future setUsername(String username) async {
    await _preferences.setString(_keyUsername, username);
  }

  static String? getUsername() {
    final data = _preferences.getString(_keyUsername);

    if (data != null) return data;
    return null;
  }

  static Future setListUser(List<String> userList) async {
    await _preferences.setStringList(_keylistUser, userList);
  }

  static List<String>? getListUser() {
    final data = _preferences.getStringList(_keylistUser);

    if (data != null) return data;
    return null;
  }

  static Future setListTask(List<String> taskList) async {
    await _preferences.setStringList(_keylistTask, taskList);
  }

  static List<String>? getListTask() {
    final data = _preferences.getStringList(_keylistTask);

    if (data != null) return data;
    return null;
  }
}
