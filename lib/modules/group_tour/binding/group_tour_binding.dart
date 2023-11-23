import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/controller/base_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/group_tour/controller/group_tour_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';



class GroupTourBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<GroupTourController>(
          () => GroupTourController(),
    );




  }
}
