import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkModes';

  saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFromBox() {
    return boxStorage.read<bool>(key) ?? true;
  }

  ThemeMode get getThemeData {
    return getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.dark;
  }

  void changesTheme() {
    Get.changeThemeMode(
      getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark,
    );
    saveThemeDataInBox(!getThemeDataFromBox());
    Get.forceAppUpdate();
  }
}
