import 'package:get/get.dart';
import 'package:project/core/class/crud.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
