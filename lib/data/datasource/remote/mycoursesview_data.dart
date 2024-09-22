import 'package:project/core/class/crud.dart';
import 'package:project/linkapi.dart';

class MyCoursesViewData {
  Crud crud;
  MyCoursesViewData(this.crud);
  getData(int id) async {
    var response =
        await crud.postData(AppLink.mycoursesView, {"id": id.toString()});

    return response.fold((l) => l, (r) => r);
  }

  deleteData(int id) async {
    var response =
        await crud.postData(AppLink.mycoursesViewRemove, {"id": id.toString()});

    return response.fold((l) => l, (r) => r);
  }
}
