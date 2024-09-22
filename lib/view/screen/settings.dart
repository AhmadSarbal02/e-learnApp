import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/settings_controller.dart';
import 'package:project/core/constant/color.dart';
import 'package:project/core/constant/imageasset.dart';
import 'package:project/core/constant/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
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
                          title: Text("   Settings ",
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
                      onTap: () {
                        Get.toNamed(AppRoute.usefulTips);
                      },
                      trailing: const Icon(Icons.tips_and_updates_outlined),
                      title: const Text("Useful Tips"),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.aboutUs);
                      },
                      trailing: const Icon(Icons.help_outline_rounded),
                      title: const Text("About us"),
                    ),
                    ListTile(
                      onTap: () async {
                        await launchUrl(Uri.parse("tel:+962788664341"));
                      },
                      trailing: const Icon(Icons.phone_callback_outlined),
                      title: const Text("Contact us"),
                    ),
                    ListTile(
                      onTap: () {
                        controller.logout();
                      },
                      title: const Text("Logout"),
                      trailing: const Icon(Icons.exit_to_app),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
