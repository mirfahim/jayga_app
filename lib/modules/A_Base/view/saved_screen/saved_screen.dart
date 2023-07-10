import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class SavedView extends GetView<HomeController> {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saved",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.textColorGreen,
                    radius: 12,
                      child: Icon(Icons.add)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Create your saved list",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "As you search, tap the heart icon to save your favourite places and experiences to this list.",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    //  Get.toNamed(Routes.HOME);
                    //controller.visible.value++;
                    // controller.loginController();
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: controller.visible.value == 1 ? 50 : 60,
                    width: controller.visible.value == 1 ? 50 : 140,
                    decoration: BoxDecoration(
                        color: AppColors.textColorGreen,
                        borderRadius: BorderRadius.circular(
                            controller.visible.value == 1 ? 60 : 50)),
                    alignment: Alignment.center,
                    child: controller.visible.value == 1
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Start Exploring",
                            style: TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: 12,
                            ),
                          ),
                  ),
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}
