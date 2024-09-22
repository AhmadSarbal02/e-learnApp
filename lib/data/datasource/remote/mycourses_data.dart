import 'package:project/core/class/crud.dart';
import 'package:project/linkapi.dart';

class MyCoursesData {
  Crud crud;
  MyCoursesData(this.crud);
  addMyCourses(int usersid, int coursesid) async {
    var response = await crud.postData(AppLink.mycoursesAdd,
        {"usersid": usersid.toString(), "coursesid": coursesid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeMyCourses(int usersid, int coursesid) async {
    var response = await crud.postData(AppLink.mycoursesRemove,
        {"usersid": usersid.toString(), "coursesid": coursesid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getCountMyCourses(int usersid, int coursesid) async {
    var response = await crud.postData(AppLink.mycoursesCount,
        {"usersid": usersid.toString(), "coursesid": coursesid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
