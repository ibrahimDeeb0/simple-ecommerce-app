import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/logic/controllers/theme_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(); //انتظر خدمات الفيربيز قبل ما تعمل رن
  await ProductServices.initDioWebServices();
  //await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopp App',
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().getThemeData,
       initialRoute: AppRoutes.welcome,
     // initialRoute: AppRoutes.mainHome,
      getPages: AppRoutes.routs,
    );
  }
}
