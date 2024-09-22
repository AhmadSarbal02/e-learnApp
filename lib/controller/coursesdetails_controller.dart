import 'package:get/get.dart';
import 'package:project/controller/mycourses_controller.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/remote/mycourses_data.dart';
import 'package:project/data/model/coursesmodel.dart';

abstract class CourseDetailsController extends GetxController {}

class CourseDetailsControllerImp extends CourseDetailsController {
  late CoursesModel coursesModel;
  late MyCoursesController myCoursesController;

  intialData() {
    coursesModel = Get.arguments['coursesmodel'];
    // تسجيل MyCoursesController
    myCoursesController = Get.put(MyCoursesController());
  }

  MyCoursesData myCoursesData = MyCoursesData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  void addCourseToMyCourses() async {
    // استخدام MyCoursesController المسجل
    await myCoursesController.addMyCourses(coursesModel.coursesId!);
    myCoursesController.updateFavoriteStatus(coursesModel.coursesId!, true);
  }

  @override
  void onInit() {
    intialData();

    super.onInit();
  }
}
