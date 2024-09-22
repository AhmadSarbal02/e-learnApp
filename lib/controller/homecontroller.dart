import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/function/handlingdata.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/remote/homedata.dart';
import 'package:project/data/model/coursesmodel.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  goToCourses(List categories, int selectedCat, int categoryid);
  goToPageCourseDetails(CoursesModel coursesModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  int? id;
  String? phone;
  String? email;

  HomeData homedata = HomeData(Get.find());

  List categories = [];
  List courses = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getInt("id");
    phone = myServices.sharedPreferences.getString("phone");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        courses.addAll(response['coursesview']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToCourses(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.courses, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catid": categoryid,
    });
  }

  @override
  goToPageCourseDetails(coursesModel) {
    Get.toNamed(AppRoute.courseDetails,
        arguments: {"coursesmodel": coursesModel});
  }
}

class SearchMixController extends GetxController {
  List<CoursesModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => CoursesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchCourses() {
    isSearch = true;
    searchData();
    update();
  }
}
