import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/coursesdetails_controller.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/view/widget/coursedetails/cstombottoncoursesdetails.dart';
import 'package:project/view/widget/coursedetails/topcoursepagedetails.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    CourseDetailsControllerImp controller =
        Get.put(CourseDetailsControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        toolbarHeight: 30,
      ),
      body: Container(
        color: AppColor.backGround,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const TopCoursePageDetails(),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${controller.coursesModel.coursesName}",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
//                                   color: AppColor.primaryColor,
                          )),
                  const SizedBox(height: 10),
                  Text("${controller.coursesModel.coursesVideo}",
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            // استدعاء الزر المخصص مع دالة التحكم `addCourseToMyCourses`
            const CustomButtonCourseDetails(),
          ],
        ),
      ),
    );
  }
}
