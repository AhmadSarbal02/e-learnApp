import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/homecontroller.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/data/model/coursesmodel.dart';
import 'package:project/linkapi.dart';
import 'package:project/view/widget/customappbar.dart';
import 'package:project/view/widget/home/cstometitlehome.dart';
import 'package:project/view/widget/home/listcategorieshome.dart';
import 'package:project/view/widget/home/listcourseshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                CustomAppBar(
                  mycontroller: controller.search!,
                  titleappbar: "Find Courses",
                  // onPressedIcon: () {},
                  onPressedSearch: () {
                    controller.onSearchCourses();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressedMyCoursesIcon: () {
                    Get.toNamed(AppRoute.settings);
                  },
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Stack(children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ListTile(
                                      title: Text("HI ${controller.username}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30)),
                                      subtitle: const Text("Best Free Courses",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                  ),
                                  Positioned(
                                    top: -20,
                                    right: -20,
                                    child: Container(
                                      height: 160,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: AppColor.secoundColor,
                                          borderRadius:
                                              BorderRadius.circular(160)),
                                    ),
                                  )
                                ]),
                              ),
                              const CustomTitleHome(title: "Categories"),
                              const ListCategoriesHome(),
                              const CustomTitleHome(title: "Courses for you"),
                              const ListCoursesHome(),
                            ],
                          )
                        : ListCoursesSearch(listdatamodel: controller.listdata))

                // const CustomTitleHome(title: "Offer"),
                // const ListCoursesHome()
              ],
            )));
  }
}

class ListCoursesSearch extends GetView<HomeControllerImp> {
  final List<CoursesModel> listdatamodel;
  const ListCoursesSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppRoute.courseDetails,
                  arguments: {'coursesmodel': controller.listdata[index]});
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestCourses}/${listdatamodel[index].coursesImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].coursesName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
