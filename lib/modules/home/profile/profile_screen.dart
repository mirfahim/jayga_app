import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayga/modules/booking/view/my_booking_history/payment_webview.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../services/auth_services.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: WillPopScope(
        onWillPop: () async {
          final value = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Are you sure you want to exit?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      //return false when click on "NO"
                      child: Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      //return true when click on "Yes"
                      child: Text('Yes'),
                    ),
                  ],
                );
              });
          return value == true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return controller.profileData.value.userData == null
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .3,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 40.0),
                                    child: InkWell(
                                      onTap: () {
                                        showPopup(context, 'cover');
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.elliptical(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                100.0),
                                            bottomRight: Radius.elliptical(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                100.0),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: controller.coverImageString
                                                    .value.isNotEmpty
                                                ? NetworkImage(
                                                    "https://new.jayga.io/uploads/usercovers/${controller.coverImageString.value}")
                                                : NetworkImage(
                                                    'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              Get.find<HomeController>()
                                                  .profileData
                                                  .value
                                                  .userData!
                                                  .first
                                                  .name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.star,
                                            size: 30,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showPopup(context, 'profile');
                                          },
                                          child: CircleAvatar(
                                            radius: 70,
                                            child: CachedNetworkImage(
                                              imageUrl: Get.find<
                                                          HomeController>()
                                                      .profileData
                                                      .value
                                                      .userPictures!
                                                      .isEmpty
                                                  ? "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"
                                                  : "https://new.jayga.io/uploads/useravatars/${Get.find<HomeController>().profileData.value.userPictures!.first.userFilename}",
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
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
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Image(
                                                  image: AssetImage(
                                                    'assets/images/jayga_logo.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.filter,
                                            size: 30,
                                            color: AppColors.textColorGreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            InkWell(
                              onTap: () {
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
                                    subtitle: Text(
                                        "It’s simple to get set up and start earning."),
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
                              height: MediaQuery.of(context).size.height * .3,
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
                                    onTap: () {
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
                                    onTap: () {
                                      Get.toNamed(Routes.VISTEDBD);
                                    },
                                    child: Container(
                                      height: 40,
                                      child: ListTile(
                                        leading: Icon(Icons.settings),
                                        title: Text(
                                            "How many division you visited?"),
                                        trailing: Icon(Icons.navigate_next),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.VISTEDCOUNTRY);
                                    },
                                    child: Container(
                                      height: 40,
                                      child: ListTile(
                                        leading: Icon(Icons.settings),
                                        title: Text(
                                            "How many country you visted?"),
                                        trailing: Icon(Icons.navigate_next),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {
                                      Get.to(PaymentWeb(
                                        appBar: "Payments and Payouts",
                                        url: "https://jayga.io/refund.html",
                                      ));
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
                                    onTap: () {
                                      Get.to(PaymentWeb(
                                        appBar: "Payments and Payouts",
                                        url: "https://jayga.io/refund.html",
                                      ));
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
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.NOTIFICATIONLIST);
                                    },
                                    child: Container(
                                      height: 40,
                                      child: ListTile(
                                        leading: Icon(Icons.settings),
                                        title: badges.Badge(
                                            badgeStyle: badges.BadgeStyle(
                                              badgeColor: AppColors.redButton,
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            badgeContent: Text(
                                              "5",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            child: Text("Notifications")),
                                        trailing: Icon(Icons.navigate_next),
                                      ),
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
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.HOSTPROFILESETTING);
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.settings),
                                      title: Text("Host settings"),
                                      trailing: Icon(Icons.navigate_next),
                                    ),
                                  ),
                                  Text(
                                    "Support",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.makePhoneCall("01764314845");
                                    },
                                    child: Container(
                                      height: 40,
                                      child: ListTile(
                                        leading: Icon(Icons.settings),
                                        title: Text("Get help"),
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
                                    onTap: () {
                                      PaymentWeb(
                                        appBar: "Terms and Condition",
                                        url:
                                            "https://jayga.io/terms_conditions.html",
                                      );
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
                                    onTap: () {
                                      PaymentWeb(
                                        appBar: "Privacy and Sahring",
                                        url:
                                            "https://jayga.io/privacy_policy.html",
                                      );
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.find<AuthService>()
                                          .removeCurrentUser();
                                      Get.toNamed(Routes.SPLASHSCREEN);
                                    },
                                    child: Text(
                                      "Log out",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.textColorRed,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                }),
              ],
            ),
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
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Gallary'.tr),
                    onTap: () {
                      controller.getImage(ImageSource.gallery, type, "2");
                      Get.back();
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
