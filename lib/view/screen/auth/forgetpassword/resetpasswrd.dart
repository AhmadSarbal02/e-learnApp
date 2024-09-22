import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/controller/auth/resetpassword_controller.dart';

import 'package:project/core/constant/color.dart';
import 'package:project/core/function/validinput.dart';
import 'package:project/view/widget/auth/custombuttonauth.dart';
import 'package:project/view/widget/auth/custometexttitleauth.dart';
import 'package:project/view/widget/auth/customtextbodyauth.dart';
import 'package:project/view/widget/auth/customtextformauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        centerTitle: true,
        title: Text('31'.tr,
            style: const TextStyle(color: AppColor.grey, fontSize: 22)),
      ),
      body: Container(
        color: AppColor.backGround,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextTitleAuth(
                text: "32".tr,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextBodyAuth(text: "33".tr),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormAuth(
                obscureText: true,
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 8, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: "12".tr,
                labeltext: "23".tr,
                icondata: Icons.lock_outline,
              ),
              CustomTextFormAuth(
                obscureText: true,
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 8, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: "34".tr,
                labeltext: "23".tr,
                icondata: Icons.lock_outline,
              ),
              CustomButtonAuth(
                text: "35".tr,
                onPressed: () {
                  controller.goToSuccessResetPassword();
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
