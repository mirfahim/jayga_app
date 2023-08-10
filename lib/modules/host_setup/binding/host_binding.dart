import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/controller/base_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';

import '../controller/host_controller.dart';



class HostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HostController>(
          () => HostController(),
    );




  }
}
