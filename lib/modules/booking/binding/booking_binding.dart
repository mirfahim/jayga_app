import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/controller/base_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';



class BookingBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<BookingController>(
          () => BookingController(),
    );




  }
}
