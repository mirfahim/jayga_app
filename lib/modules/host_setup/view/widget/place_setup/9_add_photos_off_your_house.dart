import 'dart:convert';

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

class AddPhotosOfHouse extends GetView<HostController> {
  const AddPhotosOfHouse({Key? key}) : super(key: key);
//page13
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:
         Obx(
            () {
             return Container(
              color: AppColors.appBackGroundBrn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height *.72,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Add some photos of your house",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Text(
                            "You’ll need 5 photos to get started. You can add more or make changes later.",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          InkWell(
                            onTap: (){
                              showPopup(context, 'listing', false);
                            },
                            child: Row(

                              children: [


                                Container(
                                  height: MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width * .8,
                                  decoration: BoxDecoration(
                                      color: AppColors.jaygaTextFldColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding:  EdgeInsets.all(16.0),

                                    child:ListTile(
                                      title: Text("Add Photos"),
                                      leading: Icon(Icons.add),



                                    )

                                  ),

                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: (){
                              showPopup(context, 'listing', true);
                            },
                            child: Row(

                              children: [


                                Container(
                                  height: MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width * .8,
                                  decoration: BoxDecoration(
                                      color: AppColors.jaygaTextFldColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                      padding:  EdgeInsets.all(16.0),

                                      child:ListTile(
                                        title: Text("Take new photos"),
                                        leading: Icon(Icons.camera_alt),



                                      )

                                  ),

                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height *.25,
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 5.0,
                                ),
                                itemCount: controller.listingImagesBase64.length,
                                itemBuilder: (BuildContext context, int index) {

                                  return Container(
                                    child:  ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image.memory(
                                            base64Decode(
                                              controller.listingImagesBase64[index],
                                            ),
                                            height: Get.size.width * .2,
                                            width: Get.size.width * .3,
                                            fit: BoxFit.fill,
                                          ),
                                        )

                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
        );
           }
         )


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
                    title: camera == true ?  Text('Camera'.tr) :  Text('Gallary'.tr),
                    onTap: () {
                      controller.getImage(camera == true ? ImageSource.camera : ImageSource.gallery, type);
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
