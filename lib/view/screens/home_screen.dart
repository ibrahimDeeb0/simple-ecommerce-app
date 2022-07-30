import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/home/search_text_form.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/card_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor:
          Get.isDarkMode ? darkGreyClr : context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? backDarkClr : mainColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextUtils(
                    text: 'Find Your',
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  SizedBox(height: 5),
                  TextUtils(
                    text: 'INSPIRATION',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  SizedBox(height: 20),
                  SearchFormText(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                text: 'Category',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 30),
          CardItems(),
        ],
      ),
    ));
  }
}
