import 'dart:async';

import 'package:dataontest/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // checkLogin();
  }

  @override
  void onReady() {
    super.onReady();
    Timer(
      const Duration(milliseconds: 1000),
      () => checkLogin(),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkLogin() {
    bool isLogin = box.read('is_login') ?? false;
    print(isLogin);
    if (!isLogin) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.MAIN_MENU);
    }
  }
}
