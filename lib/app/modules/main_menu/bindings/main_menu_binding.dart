import 'package:dataontest/app/modules/home/controllers/home_controller.dart';
import 'package:dataontest/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_menu_controller.dart';

class MainMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainMenuController>(() => MainMenuController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
