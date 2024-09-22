import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/controller/homecontroller.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/data/model/coursesmodel.dart';
import 'package:project/linkapi.dart';

class ListCoursesHome extends GetView<HomeControllerImp> {
  const ListCoursesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.courses.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        final CoursesModel course =
            CoursesModel.fromJson(controller.courses[index]);
        return GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.courseDetails,
                arguments: {'coursesmodel': course});
          },
          child: CoursesHome(
            coursesModel: course,
          ),
        );
      },
    );
  }
}

class CoursesHome extends StatelessWidget {
  final CoursesModel coursesModel;
  const CoursesHome({super.key, required this.coursesModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.imagestCourses}/${coursesModel.coursesImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 120,
          width: 200,
        ),
        Positioned(
          left: 10,
          child: Text(
            "${coursesModel.coursesName}",
            style: const TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
