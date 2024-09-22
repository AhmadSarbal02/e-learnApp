import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/localization/changelocal.dart';
import 'package:project/view/widget/language/custombutton.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backGround,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                "1".tr,
                // ignore: deprecated_member_use
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            CustomButtonLang(
              lang: "Ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtonLang(
              lang: "En",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
