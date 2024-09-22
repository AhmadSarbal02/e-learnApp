import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/homecontroller.dart';

import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/imageasset.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          toolbarHeight: 2,
        ),
        body: Container(
          color: AppColor.backGround,
          child: ListView(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Stack(children: [
                      Container(
                        alignment: Alignment.center,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: AppColor.primaryColor,
                        ),
                        child: const ListTile(
                          title: Text("   My Profile ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30)),
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
                              borderRadius: BorderRadius.circular(160)),
                        ),
                      )
                    ]),
                    Positioned(
                        top: Get.width / 3.9,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[100],
                            backgroundImage:
                                const AssetImage(AppImageAsset.avatar),
                          ),
                        )),
                  ]),
              const SizedBox(height: 100),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    // ListTile(
                    //   // onTap: () {},
                    //   trailing: Switch(
                    //     onChanged: (val) {},
                    //     value: true,
                    //     activeColor: AppColor.primaryColor,
                    //   ),
                    //   title: const Text("Disable Notificatios"),
                    // ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.person),
                      title: Text(
                        'Name  :      ${controller.username}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.phone_android_outlined),
                      title: Text(
                        'Phone :      ${controller.phone}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ListTile(
                      onTap: () async {},
                      leading: const Icon(Icons.email_outlined),
                      title: Text(
                        'Email  :      ${controller.email}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
