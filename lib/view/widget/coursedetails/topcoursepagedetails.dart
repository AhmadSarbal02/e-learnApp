import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/coursesdetails_controller.dart';

import 'package:project/linkapi.dart';

class TopCoursePageDetails extends GetView<CourseDetailsControllerImp> {
  const TopCoursePageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.coursesModel.coursesId!}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imagestCourses}/${controller.coursesModel.coursesImage!}",
                height: 250,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
