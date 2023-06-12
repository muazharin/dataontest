import 'package:dataontest/app/data/dummy/user_dummy.dart';
import 'package:dataontest/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var username = TextEditingController();
  var password = TextEditingController();
  var isComplete = false;
  var key = GlobalKey<FormState>();
  var box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChanged() {
    if (username.value.text.isNotEmpty && password.value.text.isNotEmpty) {
      isComplete = true;
    } else {
      isComplete = false;
    }
    update();
  }

  void handleLogin() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      if (username.text != userdummy['username']) {
        Get.rawSnackbar(message: "Wrong email", backgroundColor: Colors.red);
      } else if (password.text != userdummy['password']) {
        Get.rawSnackbar(message: "Wrong password", backgroundColor: Colors.red);
      } else {
        box.write("is_login", true);
        Get.offAllNamed(Routes.MAIN_MENU);
      }
    }
  }
}
