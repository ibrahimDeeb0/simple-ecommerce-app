import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Container(
                  width: 190,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: TextUtils(
                      text: 'Welcome',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 230,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                          text: 'Asroo',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(width: 7),
                        TextUtils(
                          text: 'Shop',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 250),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(Routes.loginScreen);
                    Get.offNamed(Routes.loginScreen);
                  },
                  child: const TextUtils(
                    text: 'Get Start',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                      text: 'Don\'t have an Account?',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.signUpScreen);
                      },
                      child: const TextUtils(
                        text: 'Sign Up',
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
