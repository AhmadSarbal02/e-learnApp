import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/forgetpasswrd_controller.dart';

import 'package:project/core/constant/color.dart';
import 'package:project/core/function/validinput.dart';
import 'package:project/view/widget/auth/custombuttonauth.dart';
import 'package:project/view/widget/auth/custometexttitleauth.dart';
import 'package:project/view/widget/auth/customtextbodyauth.dart';
import 'package:project/view/widget/auth/customtextformauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        centerTitle: true,
        title: Text('24'.tr,
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
                text: "25".tr,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextBodyAuth(text: "26".tr),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormAuth(
                obscureText: false,
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 10, 100, "email");
                },
                mycontroller: controller.email,
                hinttext: "11".tr,
                labeltext: "21".tr,
                icondata: Icons.email_outlined,
              ),
              CustomButtonAuth(
                text: "27".tr,
                onPressed: () {
                  controller.goToVerfiyCode();
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
