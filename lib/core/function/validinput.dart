import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "40".tr;
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "41".tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "42".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "43".tr;
    }
  }

  if (val.length < min) {
    return "${"44".tr} $min";
  }

  if (val.length > max) {
    return "${"45".tr} $max";
  }
}
