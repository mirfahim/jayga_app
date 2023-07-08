import 'package:get/get.dart';
import 'package:jayga/modules/splash_screen/controller/splash_controller.dart';



class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
          () => SplashscreenController(),
    );
  }
}
