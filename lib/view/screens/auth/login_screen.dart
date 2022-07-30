import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/auth/auth_button.dart';
import 'package:e_commerce/view/widgets/auth/auth_text_from_field.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widgets/auth/container_under.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // //? استدعيها أول ما أخش الصفحة او لما افتح التطبيق
  // final controller = Get.put(AuthController());
  //
  // //? استدعيها لما أنا اطلبها
  // final controllers = Get.lazyPut(() => AuthController());

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.25,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              fontSize: 38,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(width: 6.0),
                            TextUtils(
                              text: 'IN',
                              fontSize: 38,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none,
                            ),
                          ],
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
                              return 'Enter valid name!';
                            } else {
                              return null;
                            }
                          },
                          obscureText: false,
                          suffixIcon: const Text(''),
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) => AuthTextFromField(
                            hintText: 'Password',
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : const Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            controller: passController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value.toString().length <= 6) {
                                return 'Password should be longer or equal to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            obscureText: controller.isVisibility ? false : true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forget Password?',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              underLine: TextDecoration.none,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        GetBuilder<AuthController>(
                          builder: (_) => AuthButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passController.text;

                                controller.logInUsingFirebase(
                                  email: email,
                                  password: password,
                                );
                              }
                            },
                            text: 'LOG IN',
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 20,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Image.asset('assets/images/facebook.png'),
                              onTap: () {
                                Get.toNamed(Routes.mainScreen);
                              },
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              child: Image.asset('assets/images/google.png'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Don\t have an Account? ',
                textButton: 'Sign up',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
