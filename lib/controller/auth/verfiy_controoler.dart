// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';

abstract class VerifyController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyControllerImp extends VerifyController {
  late String verifycode;
  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
