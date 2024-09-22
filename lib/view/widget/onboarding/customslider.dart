import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/onboarding_controller.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: onBoardingList[i].title!,
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.headlineLarge,
                          children: <TextSpan>[
                            const TextSpan(
                                text: ' e-learn \n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                )),
                            TextSpan(
                                text: '3'.tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  onBoardingList[i].image!,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ],
            ));
  }
}
