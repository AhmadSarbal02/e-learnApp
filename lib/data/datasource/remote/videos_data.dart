import 'package:project/core/class/crud.dart';
import 'package:project/linkapi.dart';

class VideosData {
  Crud crud;
  VideosData(this.crud);
  getVideos(int courseid) async {
    var response =
        await crud.postData(AppLink.videos, {"course_id": courseid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
