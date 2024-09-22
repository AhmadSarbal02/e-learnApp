import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/view/widget/auth/custombuttonauth.dart';
import 'package:project/view/widget/auth/custometexttitleauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        centerTitle: true,
        title: Text('36'.tr,
            style: const TextStyle(color: AppColor.grey, fontSize: 22)),
      ),
      body: Container(
        width: double.infinity,
        color: AppColor.backGround,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 150,
              color: AppColor.primaryColor,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextTitleAuth(
              text: "37".tr,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                // alignment: Alignment.center,
                child: Text(
                  "38".tr,
                  style: Theme.of(context)
                      .textTheme
                      // ignore: deprecated_member_use
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "8".tr,
                onPressed: () {
                  Get.offNamed(AppRoute.login);
                  // controller.signUp();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
