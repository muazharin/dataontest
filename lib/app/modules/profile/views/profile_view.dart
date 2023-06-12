import 'dart:io';

import 'package:dataontest/app/data/dummy/user_dummy.dart';
import 'package:dataontest/app/data/services/validators.dart';
import 'package:dataontest/app/data/widgets/button_default.dart';
import 'package:dataontest/app/data/widgets/input_password.dart';
import 'package:dataontest/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                controller.box.remove("is_login");
                Get.offAllNamed(Routes.LOGIN);
              },
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => controller.getImage(ImageSource.camera),
                          child: const ListTile(
                            leading: Icon(Icons.camera),
                            title: Text("Camera"),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.getImage(ImageSource.gallery),
                          child: const ListTile(
                            leading: Icon(Icons.image),
                            title: Text("Gallery"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: GetBuilder<ProfileController>(
                builder: (context) {
                  return userdummy['foto']!.isEmpty
                      ? const Icon(
                          Icons.person_outlined,
                          color: Colors.blue,
                          size: 100,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            File("${userdummy['foto']}"),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                },
              ),
            ),
            GetBuilder<ProfileController>(
              builder: (context) {
                return Expanded(
                  child: Form(
                    key: controller.key,
                    child: ListView(
                      children: [
                        const SizedBox(height: 32),
                        const Text("Password"),
                        const SizedBox(height: 8),
                        InputPassword(
                          hintText: 'New Password',
                          controller: controller.password,
                          onChanged: (_) => controller.onChanged(),
                          validator: (v) => valPassword!(v, 'New Password'),
                        ),
                        const SizedBox(height: 16),
                        const Text("Confirm Password"),
                        const SizedBox(height: 8),
                        InputPassword(
                          hintText: 'Confirm New Password',
                          controller: controller.cpassword,
                          onChanged: (_) => controller.onChanged(),
                          validator: (v) => valCPassword!(v,
                              'Confirm New Password', controller.password.text),
                        ),
                        const SizedBox(height: 32),
                        ButtonDefault(
                          text: 'Update Password',
                          color: !controller.isComplete
                              ? Colors.grey[350]
                              : Colors.blue,
                          onTap: !controller.isComplete
                              ? () {}
                              : controller.handleLogin,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
