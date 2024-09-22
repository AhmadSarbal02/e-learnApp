// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/function/handlingdata.dart';
import 'package:project/data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerifySignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifySignUpControllerImp extends VerifySignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());
  // late String verifycode;
  String? email;
  StatusRequest? statusRequest;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeSignUpData.postdata(email!, verfiyCodeSignUp);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successsignup);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verfiy Code Not Correct ");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
