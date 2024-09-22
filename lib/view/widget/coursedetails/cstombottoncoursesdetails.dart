import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/controller/coursesdetails_controller.dart';

import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/routes.dart';

class CustomButtonCourseDetails extends GetView<CourseDetailsControllerImp> {
  const CustomButtonCourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // MyCoursesController myCoursesController = Get.put(MyCoursesController());
    return SizedBox(
      width: 180,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          // Get the course ID from the controller
          // int courseId = controller.coursesModel.coursesId!;
          // // Add the course to My Courses
          // myCoursesController.addMyCourses(courseId);
          controller.addCourseToMyCourses();
          Get.offAllNamed(AppRoute.home);
        },
        color: AppColor.primaryColor,
        child: const Text(
          "Add To My Courses",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
