import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/courses_controller.dart';
import 'package:project/controller/mycourses_controller.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/data/model/coursesmodel.dart';
import 'package:project/view/screen/home.dart';
import 'package:project/view/widget/customappbar.dart';
import 'package:project/view/widget/home/courses/customlistcourses.dart';
import 'package:project/view/widget/home/courses/listcoursescategorise.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    CoursesControllerImp controller = Get.put(CoursesControllerImp());
    MyCoursesController controllermycourses = Get.put(MyCoursesController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            mycontroller: controller.search!,
            titleappbar: "Find Courses",
            onPressedSearch: () {
              controller.onSearchCourses();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
            onPressedMyCoursesIcon: () {
              Get.toNamed(AppRoute.settings);
            },
          ),
          const SizedBox(height: 20),
          const ListCategoriesCourses(),
          GetBuilder<CoursesControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .6,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (BuildContext context, index) {
                            controllermycourses.isMyCourses[
                                    controller.data[index]['courses_id']] =
                                controller.data[index]['mycourses'];
                            return CustomListCourses(
                              coursesModel:
                                  CoursesModel.fromJson(controller.data[index]),
                              onCardTap: () {
                                controller.goToPageCourseDetails(
                                    CoursesModel.fromJson(
                                        controller.data[index]));
                              },
                            );
                          })
                      : ListCoursesSearch(listdatamodel: controller.listdata)))
        ]),
      ),
    );
  }
}
