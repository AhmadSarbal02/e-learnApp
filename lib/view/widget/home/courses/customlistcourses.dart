import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/controller/courses_controller.dart';
import 'package:project/controller/mycourses_controller.dart';
import 'package:project/core/constant/color.dart';

import 'package:project/data/model/coursesmodel.dart';
import 'package:project/linkapi.dart';

class CustomListCourses extends GetView<CoursesControllerImp> {
  final CoursesModel coursesModel;
  final VoidCallback onCardTap;

  const CustomListCourses({
    super.key,
    required this.coursesModel,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onCardTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${coursesModel.coursesId!}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagestCourses}/${coursesModel.coursesImage!}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(coursesModel.coursesName!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    height: 120,
                    child: Column(
                      children: [
                        Text(coursesModel.coursesDesc!,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<MyCoursesController>(
                          builder: (myCoursesController) => IconButton(
                              onPressed: () {
                                if (myCoursesController
                                        .isMyCourses[coursesModel.coursesId] ==
                                    1) {
                                  myCoursesController.setMyCourses(
                                      coursesModel.coursesId, 0);
                                  myCoursesController
                                      .removeMyCourses(coursesModel.coursesId!);
                                } else {
                                  myCoursesController.setMyCourses(
                                      coursesModel.coursesId, 1);
                                  myCoursesController
                                      .addMyCourses(coursesModel.coursesId!);
                                }
                                controller.updateFavoriteStatus(
                                    coursesModel.coursesId!,
                                    myCoursesController.isMyCourses[
                                            coursesModel.coursesId] ==
                                        1);
                              },
                              icon: Icon(
                                myCoursesController.isMyCourses[
                                            coursesModel.coursesId] ==
                                        1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              )))
                    ],
                  )
                ]),
          ),
        ));
  }
}
