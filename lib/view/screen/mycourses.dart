import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/controller/mycoursesview_controller.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/routes.dart';

import 'package:project/view/widget/mycourses/coustomlistmycourses.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyCoursesViewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        toolbarHeight: 2,
      ),
      body: GetBuilder<MyCoursesViewController>(
          builder: ((controller) => ListView(children: [
                Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Stack(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: AppColor.primaryColor,
                          ),
                          child: const ListTile(
                            title: Text("   My Courses ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30)),
                          ),
                        ),
                        Positioned(
                          top: -20,
                          right: -20,
                          child: Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                                color: AppColor.secoundColor,
                                borderRadius: BorderRadius.circular(160)),
                          ),
                        )
                      ]),
                    ]),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .9,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return CustomListMyCourses(
                            coursesModel: controller.data[index],
                            onCardTap: () {
                              Get.toNamed(AppRoute.videos, arguments: {
                                "coursesmodel": controller.data[index],
                                "coursesId": controller.data[index].coursesId,
                              });
                            },
                          );
                        },
                      )),
                )
              ]))),
    );
  }
}
