import 'dart:io';

import 'package:dataontest/app/data/dummy/user_dummy.dart';
import 'package:dataontest/app/modules/home/views/home_view.dart';
import 'package:dataontest/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_menu_controller.dart';

class MainMenuView extends GetView<MainMenuController> {
  MainMenuView({Key? key}) : super(key: key);

  final screen = [
    Container(),
    const HomeView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainMenuController>(
        builder: (context) {
          return Container(
            color: Colors.white,
            child: IndexedStack(
              index: controller.page,
              children: screen,
            ),
          );
        },
      ),
      bottomNavigationBar: GetBuilder<MainMenuController>(
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => controller.swapMenu(0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.dashboard,
                            color: controller.page == 0
                                ? Colors.blue
                                : Colors.grey,
                            size: 32,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Features",
                            style: TextStyle(
                              color: controller.page == 0
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.swapMenu(1),
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            color: controller.page == 1
                                ? Colors.blue
                                : Colors.grey,
                            size: 32,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: controller.page == 1
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.swapMenu(2),
                      child: Column(
                        children: [
                          userdummy['foto'] == ''
                              ? Icon(
                                  Icons.person_outlined,
                                  color: controller.page == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.file(
                                    File("${userdummy['foto']}"),
                                    // "${userdummy['foto']}",
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          const SizedBox(height: 8),
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: controller.page == 2
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
