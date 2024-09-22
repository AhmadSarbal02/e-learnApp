import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/onboarding_controller.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/data/datasource/static/static.dart';

class CustomDotOnBoarding extends StatelessWidget {
  const CustomDotOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          duration: const Duration(milliseconds: 500),
                          width: controller.currentPage == index ? 15 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))
              ],
            ));
  }
}
