import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../routes/app_pages.dart';

class AddImageEditListing extends GetView<HostController> {
  const AddImageEditListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
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
      body: SingleChildScrollView(
          child: Obx(() {
        return Container(
          color: AppColors.appBackGroundBrn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .73,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                SizedBox(
                  height: Get.height *.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.getListingImages.length,
                      itemBuilder: (context, index){
                      return  Card(

                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .1,
                              width: MediaQuery.of(context).size.width * .2,
                              decoration: BoxDecoration(
                                  color: AppColors.jaygaTextFldColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child:   CachedNetworkImage(
                                  //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                  imageUrl: "https://new.jayga.io/uploads/listings/${controller.getListingImages[index].listingFilename}",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(10),
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
                              )
                            ),
                            InkWell(
                              onTap: (){
controller.deleteListingImage(imageID: controller.getListingImages[index].listingImgId, listingID: controller.getListingImages[index].listingId);
                        },
                                child: Icon(Icons.cancel, color: AppColors.textColorRed,))
                          ],
                        ),
                      );
                      }),
                ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showPopup(context, 'listing', false);
                        },
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .1,
                              width: MediaQuery.of(context).size.width * .7,
                              decoration: BoxDecoration(
                                  color: AppColors.jaygaTextFldColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      child: ListTile(
                                        title: Text("Add Photos"),
                                        leading: Icon(Icons.add),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          showPopup(context, 'listing', true);
                        },
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .1,
                              width: MediaQuery.of(context).size.width * .7,
                              decoration: BoxDecoration(
                                  color: AppColors.jaygaTextFldColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: Text("Take new photos"),
                                      leading: Icon(Icons.camera_alt),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                            ),
                            itemCount: controller.listingImagesBase64.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  base64Decode(
                                    controller.listingImagesBase64[index],
                                  ),
                                  height: Get.size.width * .2,
                                  width: Get.size.width * .3,
                                  fit: BoxFit.fill,
                                ),
                              ));
                            }),
                      ),


                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                  controller.addImage(controller.listingID.value).then((e){
                    Get.offNamed(Routes.BASE);
                  });

                },
                child: Center(
                  child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: 50,
                      width: MediaQuery.of(context).size.width*.5,
                      decoration: BoxDecoration(
                          color: AppColors.textColorGreen,
                          borderRadius: BorderRadius.circular(50)),
                      alignment: Alignment.center,
                      child: Text(
                        "Publish Images",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 15,
                        ),
                      )

                  ),
                ),
              ),
            ],
          ),
        );
      })),
    );
  }

  showPopup(context, String type, bool camera) {
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
                    title:
                        camera == true ? Text('Camera'.tr) : Text('Gallary'.tr),
                    onTap: () {
                      controller.getImage(
                          camera == true
                              ? ImageSource.camera
                              : ImageSource.gallery,
                          type);
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
