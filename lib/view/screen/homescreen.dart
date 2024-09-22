import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/homescreen_controller.dart';
import 'package:project/core/constant/color.dart';

import 'package:project/view/widget/home/cstombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  controller.changePage(2);
                },
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            // ignore: deprecated_member_use
            body: WillPopScope(
                child: controller.listPage.elementAt(controller.currentpage),
                onWillPop: () {
                  Get.defaultDialog(
                      title: "Warning",
                      middleText: "Do You Want To Exit The App ? ",
                      onConfirm: () {
                        exit(0);
                      },
                      onCancel: () {});
                  return Future.value(false);
                })));
  }
}
