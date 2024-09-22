import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:project/controller/homecontroller.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/core/function/handlingdata.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/remote/mycourses_data.dart';

class MyCoursesController extends SearchMixController {
  MyCoursesData myCoursesData = MyCoursesData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isMyCourses = {};

  setMyCourses(id, val) {
    isMyCourses[id] = val;
    update();
  }

  addMyCourses(int coursesid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myCoursesData.addMyCourses(
        myServices.sharedPreferences.getInt("id")!, coursesid);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            backgroundColor: AppColor.primaryColor,
            icon: const Icon(Icons.notification_important),
            title: "Note",
            messageText: const Text(
              "The course has been added to my courses",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }

      //End
    }
  }

  removeMyCourses(int coursesid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myCoursesData.removeMyCourses(
        myServices.sharedPreferences.getInt("id")!, coursesid);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            backgroundColor: AppColor.primaryColor,
            icon: const Icon(Icons.notification_important),
            title: "Note",
            messageText: const Text(
              "The course has been deleted to My Courses",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      //end
    }
  }

  updateFavoriteStatus(int courseId, bool isFavorite) {
    isMyCourses[courseId] = isFavorite ? 1 : 0;
    update();
  }

  void addCourseToMyCourses(int courseId) async {
    // استدعاء الدالة لإضافة الدورة
    await addMyCourses(courseId);
    // تحديث واجهة "دوراتي"
    updateMyCoursesList(courseId);
  }

  // تحديث واجهة "دوراتي"
  void updateMyCoursesList(int courseId) {
    // إضافة الدورة الجديدة إلى قائمة "دوراتي" في حالة النجاح
    data.add(courseId);
    // تحديث الحالة لإعادة بناء واجهة "دوراتي"
    update();
  }

  @override
  void onInit() {
    update();
    super.onInit();
  }
}
