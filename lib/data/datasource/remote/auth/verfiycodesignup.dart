import 'package:project/core/class/crud.dart';
import 'package:project/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verfiycode, {"email": email, "verfiycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
