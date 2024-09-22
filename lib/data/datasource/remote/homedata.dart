import 'package:project/core/class/crud.dart';
import 'package:project/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response =
        await crud.postData(AppLink.searchCourses, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
