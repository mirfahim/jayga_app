import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

import '../../../../services/auth_services.dart';

class ProfileDetailView extends GetView<HomeController> {
  const ProfileDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: Container(
          color: AppColors.textColorWhite,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                // color: AppColors.backgroundColor,
                child: Image.asset(
                  'assets/images/jayga_logo.png',
                  height: 70,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.appBackGroundBrn,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return controller.profileData.value.userData == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Edit Personal Info",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  controller.editProfileController(id:  controller.profileData.value.userData!.first.id.toString());
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: AppColors.textColorGreen),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          maxLines: 1,
                          controller: controller.nameController.value,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: AppColors.jaygaWhite,
                            focusColor: Colors.white,
                            labelText: Get.find<HomeController>().profileData.value.userData!.first.name,
                            // suffixIcon: Icon(
                            //   Icons.email_outlined,
                            // ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return "Number is Required";
                            else if (!GetUtils.isEmail(value.trim()))
                              return "Please enter valid email";
                            else
                              return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Divider(),
                            ListTile(
                              trailing: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColorGreen),
                              ),
                              title: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                controller.profileData.value.userData!.first
                                    .email,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              trailing: InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.EDITNUM);
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.textColorGreen),
                                  )),
                              title: Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                controller.profileData.value.userData!.first
                                    .phone,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              trailing: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColorGreen),
                              ),
                              title: Text(
                                "National ID",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                controller
                                    .profileData.value.userData!.first.userNid,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              trailing: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColorGreen),
                              ),
                              title: Text(
                                "Utility Bill",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.textColorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Not Provided",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
