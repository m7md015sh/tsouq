import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tsouq/bindings/auth_binding.dart';
import 'package:tsouq/bindings/register_binding.dart';
import 'package:tsouq/language/ar.dart';
import 'package:tsouq/language/localaization.dart';
import 'package:tsouq/routes_manager.dart';
import 'package:tsouq/utils/app_constants.dart';

import 'view/pages/auth/sign_in_page.dart';
import 'view/pages/on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //locale: Locale( FlutterSecureStorage().read(key: "lang").toString()),
      locale: Locale(AppConstants.ara),
      translations: LocalizationApp(),
      fallbackLocale:  Locale(AppConstants.ara),

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
        initialBinding: RegisterBinding(),

        initialRoute: AppRoutes.onBoarding,
      getPages:AppRoutes.routes

    );

  }
}


