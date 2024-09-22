import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/onboarding_controller.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/view/widget/onboarding/custombutton.dart';
import 'package:project/view/widget/onboarding/customslider.dart';
import 'package:project/view/widget/onboarding/dotcontroller.dart';

class OnBorading extends StatelessWidget {
  const OnBorading({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backGround,
          toolbarHeight: 30,
        ),
        body: Container(
          color: AppColor.backGround,
          child: const Column(
            children: [
              Expanded(
                flex: 3,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotOnBoarding(),
                      SizedBox(
                        height: 60,
                      ),
                      CustomButtonOnBoarding(),
                    ],
                  ))
            ],
          ),
        ));
  }
}
