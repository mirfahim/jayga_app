import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/controller/base_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.advancedStatusCheck(context);
    return Obx(() {
      return SideMenu(
          key: controller.endSideMenuKey.value,
          inverse: true, // end side menu
          background: AppColors.textColorGreen,
          type: SideMenuType.slideNRotate,
          menu: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: buildMenu(),
          ),
          onChange: (_isOpened) {
            controller.isOpened.value = _isOpened;
          },
          child: SideMenu(
              key: controller.gsideMenuKey.value,
              menu: buildMenu(),
              type: SideMenuType.slideNRotate,
              onChange: (_isOpened) {
                controller.isOpened.value = _isOpened;
              },
              child: IgnorePointer(
                ignoring: controller.isOpened.value,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize:
                        Size.fromHeight(70.0), // here the desired height
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              // color: AppColors.backgroundColor,
                              child: Image.asset(
                                'assets/images/jayga_logo.png',
                                height: 70,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: Get.width * .3,
                              height: Get.height * .1,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/bell.png',
                                    height: Get.height * .08,
                                    width: Get.width * .1,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.toggleMenu(true);
                                    },
                                    child: Image.asset(
                                      'assets/icons/drawer.png',
                                      height: Get.height * .08,
                                      width: Get.width * .1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  body: controller.currentPage,
                  extendBody: true,
                  bottomNavigationBar: BottomAppBar(
                    notchMargin: 6,
                    elevation: 10,
                    shape: const AutomaticNotchedShape(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                          bottom: Radius.circular(10),
                        ),
                      ),
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                controller.currentIndex.value = 0;
                              },
                              child: Container(
                                width: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.search,
                                      size: 30,
                                      color: controller.currentIndex.value == 0
                                          ? AppColors.textColorGreen
                                          : Colors.black54,
                                    ),
                                    // Icon(
                                    //   CupertinoIcons.home,
                                    //   color: controller.currentIndex.value == 0
                                    //       ? Colors.lightBlueAccent
                                    //       : Colors.grey,
                                    // ),
                                    Text(
                                      'Explore'.tr,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              controller.currentIndex.value == 0
                                                  ? AppColors.textColorGreen
                                                  : Colors.black54,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.currentIndex.value = 1;
                              },
                              child: Container(
                                width: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      size: 30,
                                      Icons.favorite_outline,
                                      color: controller.currentIndex.value == 1
                                          ? AppColors.textColorGreen
                                          : Colors.black54,
                                    ),
                                    // Icon(
                                    //   CupertinoIcons.home,
                                    //   color: controller.currentIndex.value == 0
                                    //       ? Colors.lightBlueAccent
                                    //       : Colors.grey,
                                    // ),
                                    Text(
                                      'Saved'.tr,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              controller.currentIndex.value == 1
                                                  ? AppColors.textColorGreen
                                                  : Colors.grey,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                controller.currentIndex.value = 2;
                              },
                              child: Container(
                                width: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      size: 30,
                                      Icons.book,
                                      color: controller.currentIndex.value == 2
                                          ? AppColors.textColorGreen
                                          : Colors.black54,
                                    ),
                                    // Icon(
                                    //   CupertinoIcons.home,
                                    //   color: controller.currentIndex.value == 0
                                    //       ? Colors.lightBlueAccent
                                    //       : Colors.grey,
                                    // ),
                                    Text(
                                      'My Bookings'.tr,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              controller.currentIndex.value == 2
                                                  ? AppColors.textColorGreen
                                                  : Colors.black54,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                controller.currentIndex.value = 3;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      size: 30,
                                      Icons.supervised_user_circle_outlined,
                                      color: controller.currentIndex.value == 3
                                          ? AppColors.textColorGreen
                                          : Colors.grey,
                                    ),
                                    // Icon(
                                    //   CupertinoIcons.home,
                                    //   color: controller.currentIndex.value == 0
                                    //       ? Colors.lightBlueAccent
                                    //       : Colors.grey,
                                    // ),
                                    Text(
                                      'Profile'.tr,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              controller.currentIndex.value == 3
                                                  ? AppColors.textColorGreen
                                                  : Colors.grey,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Right Tab bar icons
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )));
    });
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Get.find<HomeController>().profileData.value.userData == null
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // Container(
                     //          height: 70,
                     //          width: 70,
                     //          decoration: BoxDecoration(
                     //            shape: BoxShape.circle,
                     //          ),
                     //          child: CachedNetworkImage(
                     //            imageUrl:
                     //                "https://new.jayga.io/uploads/useravatars/${Get.find<HomeController>().profileData.value.userPictures!.first.userFilename}",
                     //            imageBuilder: (context, imageProvider) =>
                     //                Container(
                     //              decoration: BoxDecoration(
                     //                color: Colors.transparent,
                     //                borderRadius: BorderRadius.circular(20),
                     //                image: DecorationImage(
                     //                  image: imageProvider,
                     //                  fit: BoxFit.cover,
                     //                ),
                     //              ),
                     //            ),
                     //            placeholder: (context, url) => const Padding(
                     //              padding: EdgeInsets.all(5.0),
                     //              child: Image(
                     //                image: AssetImage(
                     //                  'assets/images/jayga_logo.png',
                     //                ),
                     //              ),
                     //            ),
                     //            errorWidget: (context, url, error) =>
                     //                const Padding(
                     //              padding: EdgeInsets.all(5.0),
                     //              child: Image(
                     //                image: AssetImage(
                     //                  'assets/images/jayga_logo.png',
                     //                ),
                     //              ),
                     //            ),
                     //          ),
                     //          // color: AppColors.backgroundColor,
                     //        ),
                      SizedBox(height: 16.0),
                      Text(
                        Get.find<HomeController>()
                            .profileData
                            .value
                            .userData!
                            .first
                            .name,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading:
                      const Icon(Icons.home, size: 20.0, color: Colors.white),
                  title: const Text("Home"),
                  textColor: Colors.white,
                  dense: true,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.COMMUNITYHOME);
                  },
                  leading: Image.asset('assets/icons/community.png',
                      height: Get.height * .04,
                      width: Get.size.width * .08,
                      color: AppColors.jaygaWhite),
                  title: const Text("Community"),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                ListTile(
                  onTap: () {},
                  leading: Image.asset('assets/icons/packages.png',
                      height: Get.height * .04,
                      width: Get.size.width * .08,
                      color: AppColors.jaygaWhite),
                  title: const Text("Packages"),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.GROUPTOURLIST);
                  },
                  leading: Image.asset('assets/icons/group.png',
                      height: Get.height * .04,
                      width: Get.size.width * .08,
                      color: AppColors.jaygaWhite),
                  title: const Text("Group Tour"),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.star_border,
                      size: 20.0, color: Colors.white),
                  title: const Text("Favorites"),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings,
                      size: 20.0, color: Colors.white),
                  title: const Text("Settings"),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
              ],
            ),
    );
  }
}
