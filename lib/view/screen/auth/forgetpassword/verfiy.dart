import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/verfiy_controoler.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/view/widget/auth/custometexttitleauth.dart';
import 'package:project/view/widget/auth/customtextbodyauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyController controller = Get.put(VerifyControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        centerTitle: true,
        title: Text('28'.tr,
            style: const TextStyle(color: AppColor.grey, fontSize: 22)),
      ),
      body: Container(
        color: AppColor.backGround,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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

              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPassword();
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
    );
  }
}
