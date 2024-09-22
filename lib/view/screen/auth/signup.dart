import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/controller/auth/signup_controller.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/imageasset.dart';
import 'package:project/core/function/alertexitapp.dart';
import 'package:project/core/function/validinput.dart';
import 'package:project/view/widget/auth/custombuttonauth.dart';
import 'package:project/view/widget/auth/custometexttitleauth.dart';
import 'package:project/view/widget/auth/customtextbodyauth.dart';
import 'package:project/view/widget/auth/customtextformauth.dart';
import 'package:project/view/widget/auth/customtextsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 90,
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        centerTitle: true,
        title: Text('15'.tr,
            style: const TextStyle(color: AppColor.grey, fontSize: 22)),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? Center(
                        child: Lottie.asset(AppImageAsset.loading,
                            width: 250, height: 250),
                      )
                    : Container(
                        color: AppColor.backGround,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            // physics: const NeverScrollableScrollPhysics(),
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextTitleAuth(
                                text: "9".tr,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextBodyAuth(text: "16".tr),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextFormAuth(
                                obscureText: false,
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 30, "uesrname");
                                },
                                mycontroller: controller.username,
                                hinttext: "17".tr,
                                labeltext: "20".tr,
                                icondata: Icons.person_2_outlined,
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
                              CustomTextFormAuth(
                                obscureText: false,
                                isNumber: true,
                                valid: (val) {
                                  return validInput(val!, 10, 13, "phone");
                                },
                                mycontroller: controller.phone,
                                hinttext: "18".tr,
                                labeltext: "22".tr,
                                icondata: Icons.phone_android_outlined,
                              ),
                              GetBuilder<SignUpControllerImp>(
                                builder: (controller) => CustomTextFormAuth(
                                  onTapIcon: () {
                                    controller.showPassword();
                                  },
                                  obscureText: controller.isshowpassword,
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 8, 30, "password");
                                  },
                                  mycontroller: controller.password,
                                  hinttext: "12".tr,
                                  labeltext: "23".tr,
                                  icondata: Icons.lock_outline,
                                ),
                              ),
                              CustomButtonAuth(
                                text: "15".tr,
                                onPressed: () {
                                  controller.signUp();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextSignUpOrSignIn(
                                textOne: "19".tr,
                                textTwo: "8".tr,
                                onTap: () {
                                  controller.goToLogin();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
          )),
    );
  }
}
