import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/auth/auth_button.dart';
import 'package:e_commerce/view/widgets/auth/auth_text_from_field.dart';
import 'package:e_commerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

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
        //backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                              text: 'SIGN',
                              fontSize: 38,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(width: 6.0),
                            TextUtils(
                              text: 'Up',
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
                          hintText: 'User Name',
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : const Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name!';
                            } else {
                              return null;
                            }
                          },
                          obscureText: false,
                          suffixIcon: const Text(''),
                        ),
                        const SizedBox(height: 20),
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
                            // if (RegExp(validationEmail).hasMatch(value)) {
                            //   return 'Enter valid Email !';
                            // } else {
                            //   return null;
                            // }
                            if (value!.isEmpty) {
                              return "Email required !";
                            }
                            return null;
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
                        const SizedBox(height: 50),
                        CheckWidget(),
                        const SizedBox(height: 50),
                        GetBuilder<AuthController>(
                          builder: (_) => AuthButton(
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              //   //store data to local database or to send it to pai
                              //   scaffoldKey.currentState!
                              //       .showBottomSheet((context) => Container(
                              //             width: double.infinity,
                              //             height: 120,
                              //             decoration: const BoxDecoration(
                              //                 color: Colors.deepPurpleAccent,
                              //                 borderRadius: BorderRadius.only(
                              //                   topRight: Radius.circular(12),
                              //                   topLeft: Radius.circular(12),
                              //                 )),
                              //           ));
                              // }

                              if (controller.isCheckBox == false) {
                                Get.snackbar(
                                  'Check Box',
                                  'Please, Accept terms & conditions',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                              } else if (formKey.currentState!.validate()) {
                                // .trim() // يشيل المسافات اللي المستخدم بيحطها بالخطأ بالاول او بالاخير
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passController.text;

                                controller.signUpUsingFirebase(
                                  name: name,
                                  email: email,
                                  password: password,
                                );

                                controller.isCheckBox = true;
                              }
                            },
                            text: 'SIGN UP',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an Account? ',
                textButton: 'Log in',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
