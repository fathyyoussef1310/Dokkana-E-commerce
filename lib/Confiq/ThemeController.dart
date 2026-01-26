import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ThemeManager.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;
  ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> toggletheme(bool isDarkValue) async {
    isDark.value = isDarkValue;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool("isDark", isDark.value);
  }

  Future<void> loadData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final savedTheme = _prefs.getBool("isDark") ?? false;
    isDark.value = savedTheme;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}