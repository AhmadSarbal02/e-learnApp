import 'package:project/core/class/crud.dart';
import 'package:project/linkapi.dart';

class CoursesData {
  Crud crud;
  CoursesData(this.crud);
  getData(int id, int userid) async {
    var response = await crud.postData(AppLink.coursespage,
        {"id": id.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
