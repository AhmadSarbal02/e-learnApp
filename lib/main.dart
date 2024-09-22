import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/binding/bainding.dart';

import 'package:project/core/localization/changelocal.dart';
import 'package:project/core/localization/translation.dart';

import 'package:project/routes.dart';
import 'package:project/core/services/services.dart';

// import 'package:project/view/test_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      initialBinding: Binding(),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,

      theme: controller.appTheme,
      // home: const TestView(),

      getPages: routes,
    );
  }
}
