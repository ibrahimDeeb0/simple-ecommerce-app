import 'dart:ui';

import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/auth/auth_button.dart';
import 'package:e_commerce/view/widgets/auth/auth_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        title: Text(
          'Forgot Password',
          style: TextStyle(
            color: Get.isDarkMode ? mainColor : pinkClr,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close_rounded,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'If you want to recover your account, then please your email ID below..',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 250,
                ),
                const SizedBox(height: 50),
                AuthTextFromField(
                  hintText: 'Email',
                  prefixIcon: Get.isDarkMode
                      ? Image.asset('assets/images/email.png')
                      : const Icon(
                          Icons.email,
                          color: pinkClr,
                          size: 30,
                        ),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Invalid Email';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  suffixIcon: const Text(''),
                ),
                const SizedBox(height: 50),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                    text: 'SEND',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        controller.resetPassword(email);
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
