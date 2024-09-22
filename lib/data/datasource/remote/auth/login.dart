import 'package:project/core/class/crud.dart';
import 'package:project/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(
    String email,
    String password,
  ) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
