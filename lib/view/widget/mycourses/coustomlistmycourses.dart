import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/mycoursesview_controller.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/data/model/mycoursesmodel.dart';
import 'package:project/linkapi.dart';

class CustomListMyCourses extends GetView<MyCoursesViewController> {
  final MyCoursesModel coursesModel;
  final VoidCallback onCardTap;

  const CustomListMyCourses({
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
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${coursesModel.coursesId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagestCourses}/${coursesModel.coursesImage!}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("${coursesModel.coursesName}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller
                                .deleteFromMyCourses(coursesModel.mycoursesId!);

                            // .removeMyCourses(coursesModel.mycoursesId!);
                            // deleteFromFavorite(coursesModel.favoriteId!);
                          },
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ]),
          ),
        ));
  }
}
