import 'package:dataontest/app/data/dummy/user_dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var password = TextEditingController();
  var cpassword = TextEditingController();
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
    if (password.value.text.isNotEmpty && cpassword.value.text.isNotEmpty) {
      isComplete = true;
    } else {
      isComplete = false;
    }
    update();
  }

  void handleLogin() {
    if (key.currentState!.validate()) {
      userdummy['password'] = password.text;
      password.text = '';
      cpassword.text = '';
      Get.rawSnackbar(
          message: "Password updated", backgroundColor: Colors.greenAccent);
      update();
    }
  }

  void getImage(ImageSource source) async {
    print(1);
    final image = await ImagePicker().pickImage(source: source);
    print(2);
    if (image == null) return;
    print(3);
    print(image.path);
    userdummy['foto'] = image.path;
    update();
  }
}
