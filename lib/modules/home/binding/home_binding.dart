import 'package:get/get.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';




class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}
