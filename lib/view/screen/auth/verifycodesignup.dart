import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:project/controller/auth/verifycodesignup_controller.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/imageasset.dart';
import 'package:project/view/widget/auth/custometexttitleauth.dart';
import 'package:project/view/widget/auth/customtextbodyauth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifySignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 90,
          backgroundColor: AppColor.backGround,
          elevation: 0.0,
          centerTitle: true,
          title: Text('28'.tr,
              style: const TextStyle(color: AppColor.grey, fontSize: 22)),
        ),
        body: GetBuilder<VerifySignUpControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? Center(
                  child: Lottie.asset(AppImageAsset.loading,
                      width: 250, height: 250),
                )
              : Container(
                  color: AppColor.backGround,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextTitleAuth(
                        text: "29".tr,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextBodyAuth(text: "30".tr),
                      const SizedBox(
                        height: 30,
                      ),
                      OtpTextField(
                        numberOfFields: 5,
                        fieldWidth: 50.0,
                        borderRadius: BorderRadius.circular(20.0),

                        borderColor: AppColor.primaryColor,
                        enabledBorderColor: AppColor.primaryColor,

                        focusedBorderColor: AppColor.primaryColor,

                        showFieldAsBox: true,

                        onCodeChanged: (String code) {},
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.goToSuccessSignUp(verificationCode);
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         title: const Text("Verification Code"),
                          //         content: Text('Code entered is $verificationCode'),
                          //       );
                          //     });
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
        ));
  }
}
