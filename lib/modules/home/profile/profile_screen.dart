import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/view/my_booking_history/payment_webview.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

import '../../../../services/auth_services.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                 () {



                  return controller.profileData.value.userData == null?
                  Center(child: CircularProgressIndicator()) :Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      ListTile(
                        leading: InkWell(
                          onTap: (){
                            showPopup(context, 'profile');
                          },
                          child:  controller.profile_image.value.isNotEmpty
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              base64Decode(
                                controller.profile_image.value,
                              ),
                              height: Get.size.width * .15,
                              width: Get.size.width * .15,
                              fit: BoxFit.fill,
                            ),
                          ) : controller.profileModel.value.userPictures == null ? CircleAvatar(
                            radius: 20,
                          ): Container(
                            width: MediaQuery.of(context).size.width *.1,
                            height: MediaQuery.of(context).size.height *.1,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child:   CachedNetworkImage(
                              imageUrl: "https://new.jayga.xyz/uploads/useravatars/${controller.profileModel.value.userPictures!.first.userFilename}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/jayga_logo.png',
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/jayga_logo.png',),
                                ),
                              ),
                            ),
                          ),
                        ),
                        title: Text(controller.profileData.value.userData![0].name),
                        subtitle: Text("Edit Profile"),
                        trailing: InkWell(
                          onTap: (){
                            Get.toNamed(Routes.PROFILEDETAIL);
                          },
                            child: Icon(Icons.navigate_next)),
                      ),
                      Divider(),
                      InkWell(
                        onTap: (){
                          Get.toNamed(Routes.CREATEOWNJAYGA);
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              title: Text("Setup your own place"),
                              subtitle:
                              Text("It’s simple to get set up and start earning."),
                              trailing: Container(
                                height: 70,
                                width: 70,
                                child: Image.asset(
                                  'assets/images/jayga_logo.png',
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .4,
                        child: ListView(
                          children: [
                            Text(
                              "Settings",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: (){
                                Get.toNamed(Routes.PROFILEDETAIL);
                              },
                              child: Container(
                                height: 40,
                                child: ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text("Personal information"),
                                  trailing: Icon(Icons.navigate_next),
                                ),
                              ),
                            ),
                            Divider(),
                            InkWell(
                              onTap: (){
                                PaymentWeb(appBar: "Payments and Payouts", url: "https://jayga.io/refund.html",);

                              },
                              child: Container(
                                height: 40,
                                child: ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text("Payments and payouts"),
                                  trailing: Icon(Icons.navigate_next),
                                ),
                              ),
                            ),
                            Divider(),
                            InkWell(
                              onTap: (){
                                PaymentWeb(appBar: "Payments and Payouts", url: "https://jayga.io/refund.html",);

                              },
                              child: Container(
                                height: 40,
                                child: ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text("Login and security"),
                                  trailing: Icon(Icons.navigate_next),
                                ),
                              ),
                            ),
                            Divider(),
                            Container(
                              height: 40,

                              child: ListTile(
                                leading: Icon(Icons.settings),
                                title: Text("Notifications"),
                                trailing: Icon(Icons.navigate_next),
                              ),
                            ),
                            Divider(),
                            Container(
                              height: 40,
                              child: ListTile(
                                leading: Icon(Icons.settings),
                                title: Text("Privacy and sharing"),
                                trailing: Icon(Icons.navigate_next),
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Hosting",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Host settings"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                            Text(
                              "Support",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 40,
                              child: ListTile(
                                leading: Icon(Icons.settings),
                                title: Text("Get help"),
                                trailing: Icon(Icons.navigate_next),
                              ),
                            ),
                            Divider(),
                            InkWell(
                              onTap: (){
                                controller.appReview();
                              },
                              child: Container(
                                height: 40,

                                child: ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text("App Review"),
                                  trailing: Icon(Icons.navigate_next),
                                ),
                              ),
                            ),
                            Divider(),
                            Text(
                              "Legal",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: (){
                                PaymentWeb(appBar: "Terms and Condition", url: "https://jayga.io/terms_conditions.html",);

                              },
                              child: Container(
                                height: 40,
                                child: ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text("Terms of Service"),
                                  trailing: Icon(Icons.navigate_next),
                                ),
                              ),
                            ),
                            Divider(),
                            InkWell(
                              onTap: (){
                                PaymentWeb(appBar: "Privacy and Sahring", url: "https://jayga.io/privacy_policy.html",);
                              },
                              child: Container(
                                height: 40,

                                child: ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text("Privacy Policy"),
                                  trailing: Icon(Icons.navigate_next),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                    ],
                  );
                }
              ),
              GestureDetector(
                onTap: () {
                  Get.find<AuthService>().removeCurrentUser();
                  Get.toNamed(Routes.SPLASHSCREEN);
                },
                child: Text(
                  "Log out",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.textColorGreen,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  showPopup(context, String type) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            //title: Text('Select '),
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Wrap(
                children: <Widget>[
                  // ListTile(
                  //     leading: const Icon(Icons.photo_library),
                  //     title: Text('Photo Library'.tr),
                  //     onTap: () {
                  //       controller.getImage(ImageSource.gallery, type);
                  //       Get.back();
                  //     }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Camera'.tr),
                    onTap: () {
                      controller.getImage(ImageSource.camera, type, "2");
                      Get.back();
                    },
                  ),
                ],
              ),
            )
          // actions: <Widget>[

          // ],
        );
      },
    );
  }
}
