import 'package:get/get.dart';
import 'package:project/core/class/statusrequest.dart';
import 'package:project/core/function/handlingdata.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/remote/videos_data.dart';
import 'package:project/data/model/videosmodel.dart';

class VideosController extends GetxController {
  VideosData videosData = VideosData(Get.find());

  List<VideosModel> videos = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    getVideos();
    super.onInit();
  }

  getVideos() async {
    final courseId = Get.arguments['coursesmodel'].coursesId;
    statusRequest = StatusRequest.loading;
    var response = await videosData.getVideos(courseId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        videos.addAll(responsedata.map((e) => VideosModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
