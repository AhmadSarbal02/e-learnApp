import 'package:get/get.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/function/handlingdata.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/remote/mycoursesview_data.dart';
import 'package:project/data/model/mycoursesmodel.dart';

class MyCoursesViewController extends GetxController {
  MyCoursesViewData coursesViewData = MyCoursesViewData(Get.find());

  List<MyCoursesModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await coursesViewData
        .getData(myServices.sharedPreferences.getInt("id")!);

    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyCoursesModel.fromJson(e)));
        // ignore: avoid_print
        print("data");
        // ignore: avoid_print
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromMyCourses(int mycoursesid) {
    // ignore: unused_local_variable
    var response = coursesViewData.deleteData(mycoursesid);

    data.removeWhere((element) => element.mycoursesId == mycoursesid);

    // End

    update();
  }

  @override
  void onInit() {
    update();
    getData();

    super.onInit();
  }
}
