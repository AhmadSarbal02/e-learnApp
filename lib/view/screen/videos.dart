import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/videos_controller.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/data/model/videosmodel.dart';

class Videos extends StatelessWidget {
  const Videos({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    VideosController controller = Get.put(VideosController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Course Videos ",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<VideosController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.videos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    VideosModel video = controller.videos[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.videoPlay, arguments: video);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                video.videosName!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
