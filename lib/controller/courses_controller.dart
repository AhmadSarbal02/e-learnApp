import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/homecontroller.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/function/handlingdata.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/remote/courses_data.dart';
import 'package:project/data/model/coursesmodel.dart';

abstract class CoursesController extends GetxController {
  intialData();
  changeCat(int val, int catval);
  getCourses(int categoryid);
  goToPageCourseDetails(CoursesModel coursesModel);
}

class CoursesControllerImp extends SearchMixController {
  List categories = [];
  int? catid;
  int? selectedCat;

  CoursesData coursesData = CoursesData(Get.find());

  List data = [];

  // @override
  // late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    update();
    search = TextEditingController();

    intialData();

    super.onInit();
  }

  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getCourses(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getCourses(catid!);
    update();
  }

  getCourses(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await coursesData.getData(
        categoryid, myServices.sharedPreferences.getInt("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageCourseDetails(CoursesModel coursesModel) {
    Get.toNamed(AppRoute.courseDetails,
        arguments: {"coursesmodel": coursesModel});
  }

  void updateFavoriteStatus(int courseId, bool isFavorite) {
    final index = data.indexWhere((course) => course['courses_id'] == courseId);
    if (index != -1) {
      data[index]['mycourses'] = isFavorite ? 1 : 0;
      update();
    }
  }
}
