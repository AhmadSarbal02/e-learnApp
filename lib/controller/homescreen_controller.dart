import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/view/screen/home.dart';
import 'package:project/view/screen/mycourses.dart';

import 'package:project/view/screen/myprofile.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 2;

  List<Widget> listPage = [
    const MyProfile(),
    const MyCourses(),
    const HomePage(),
  ];

  List bottomappbar = [
    {
      "title": "Profile",
      "icon": Icons.person_pin_sharp,
    },
    {
      "title": "My Courses",
      "icon": Icons.favorite_outline_outlined,
    },
    {
      "title": "home",
      "icon": Icons.home,
    },
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int i) {
    currentpage = i;
    update();
  }
}
