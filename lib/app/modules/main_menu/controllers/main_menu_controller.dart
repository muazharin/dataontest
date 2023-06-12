import 'package:get/get.dart';

class MainMenuController extends GetxController {
  var page = 1;

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

  void swapMenu(int index) {
    page = index;
    update();
  }
}
