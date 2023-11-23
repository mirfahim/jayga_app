import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/controller/base_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/payment/controller/payment_controller.dart';




class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(
          () => PaymentController(),
    );




  }
}
