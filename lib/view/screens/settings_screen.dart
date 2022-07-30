import 'package:e_commerce/logic/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.backgroundColor,
      child: Center(
        child: TextButton(
          onPressed: () {
            ThemeController().changesTheme();
          },
          child: Text(
            Get.isDarkMode ? 'Light Mode' : 'Dark Mode',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
