import 'package:project/core/class/crud.dart';
import 'package:project/linkapi.dart';

class MyProfileData {
  Crud crud;
  MyProfileData(this.crud);
  getData(int id) async {
    var response = await crud.postData(AppLink.myprofile, {
      "id": id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
