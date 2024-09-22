import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/homescreen_controller.dart';
import 'package:project/view/widget/home/cstombottonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shape: const CircularNotchedRectangle(),
            notchMargin: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(controller.listPage.length - 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return CustomButtonAppBar(
                      textbutton: controller.bottomappbar[i]['title'],
                      icondata: controller.bottomappbar[i]['icon'],
                      onPressed: () {
                        controller.changePage(i);
                      },
                      active: controller.currentpage == i ? true : false);
                }))
              ],
            )));
  }
}
