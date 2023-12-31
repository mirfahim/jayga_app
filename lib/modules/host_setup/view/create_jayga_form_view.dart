import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/modules/host_setup/view/widget/it_easy_to_tell.dart';
import 'package:jayga/modules/host_setup/view/widget/nid_page_form.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/10_give_house_a_title.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/11_describe_your_house.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/12_create_description.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/13_finish_up_and_publish.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/14_full_day_price.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/15_your_place_under_review.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/1_which_of_place_house_or_apartment.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/2_what_type_of_place.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/3_where_is_location.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/4_set_your_home_address.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/5_share_some_info_bed_wash.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/6_make_it_stand_out.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/7_what_place_hasto_offer.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/8_do_you_have_restriction.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/9_add_photos_off_your_house.dart';
import 'package:jayga/modules/host_setup/view/widget/place_setup/experience_setup.dart';
import 'package:jayga/modules/host_setup/view/widget/tell_us_about_jayga.dart';
import 'package:jayga/modules/host_setup/view/widget/type_of_property.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import '../../../utils/ui_support.dart';

class CreateJaygaFormView extends GetView<HostController> {
  const CreateJaygaFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final value = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Are you sure you want to exit?'),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    //return false when click on "NO"
                    child:Text('No'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      controller.refreshController();
                      Navigator.of(context).pop(true);
                    },
                    //return true when click on "Yes"
                    child:Text('Yes'),
                  ),
                ],
              );
            }
        );
        return value == true;
      },
      child: Scaffold(

        body: SingleChildScrollView(
          child: Obx(() {
            return Container(
              color: AppColors.appBackGroundBrn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      controller.pageIndex.value == 1
                          ? Container()
                          : InkWell(
                              onTap: () {
                                if (controller.pageIndex.value == 2) {
                                  controller.pageIndex.value = 1;
                                } else if (controller.pageIndex.value == 3) {
                                  controller.pageIndex.value = 2;
                                } else if (controller.pageIndex.value == 4) {
                                  controller.pageIndex.value = 3;
                                } else if (controller.pageIndex.value == 5) {
                                  controller.pageIndex.value = 4;
                                } else if (controller.pageIndex.value == 6) {
                                  controller.pageIndex.value = 5;
                                } else if (controller.pageIndex.value == 7) {
                                  controller.pageIndex.value = 6;
                                } else if (controller.pageIndex.value == 8) {
                                  controller.pageIndex.value = 7;
                                } else if (controller.pageIndex.value == 9) {
                                  controller.pageIndex.value = 8;
                                } else if (controller.pageIndex.value == 10) {
                                  controller.pageIndex.value = 9;
                                } else if (controller.pageIndex.value == 11) {
                                  controller.pageIndex.value = 10;
                                } else if (controller.pageIndex.value == 12) {
                                  controller.pageIndex.value = 11;
                                } else if (controller.pageIndex.value == 13) {
                                  controller.pageIndex.value = 12;
                                } else if (controller.pageIndex.value == 14) {
                                  controller.pageIndex.value = 13;
                                } else if (controller.pageIndex.value == 15) {
                                  controller.pageIndex.value = 14;
                                } else if (controller.pageIndex.value == 16) {
                                  controller.pageIndex.value = 15;
                                } else if (controller.pageIndex.value == 17) {
                                  controller.pageIndex.value = 16;
                                } else if (controller.pageIndex.value == 18) {
                                  controller.pageIndex.value = 17;
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/icons/back.png',
                                      ),
                                    )),
                              ),
                            ),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 5,
                              backgroundColor: controller.pageIndex.value == 1
                                  ? AppColors.textColorGreen
                                  : Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                              radius: 5,
                              backgroundColor: controller.pageIndex.value == 2
                                  ? AppColors.textColorGreen
                                  : Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                              radius: 5,
                              backgroundColor: controller.pageIndex.value == 3
                                  ? AppColors.textColorGreen
                                  : Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                              radius: 5,
                              backgroundColor: controller.pageIndex.value == 4
                                  ? AppColors.textColorGreen
                                  : Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                              radius: 5,
                              backgroundColor: controller.pageIndex.value == 5
                                  ? AppColors.textColorGreen
                                  : Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                              radius: 5,
                              backgroundColor: controller.pageIndex.value == 6
                                  ? AppColors.textColorGreen
                                  : Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                              radius: 5,
                              backgroundColor: controller.pageIndex.value == 7
                                  ? AppColors.textColorGreen
                                  : Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 8
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 9
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 10
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 11
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 12
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 13
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 14
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 15
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 16
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 17
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 18
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 19
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: controller.pageIndex.value == 20
                                ? AppColors.textColorGreen
                                : Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  controller.pageIndex.value == 1
                      ? NidFormView()
                      : controller.pageIndex.value == 2
                          ? TypeOfPropertyFormView()
                      : controller.pageIndex.value == 21
                      ? Experiencelanding()
                          : controller.pageIndex.value == 3
                              ? ItEasyToTellJayga()
                              : controller.pageIndex.value == 4
                                  ? TellUsAboutJayga()
                                  : controller.pageIndex.value == 5
                                      ? WhichOfPlace()
                                      : controller.pageIndex.value == 6
                                          ? WhatTypeOfPropertyHasToOfferView()
                                          : controller.pageIndex.value == 7
                                              ? WhereIsPlace()
                                              : controller.pageIndex.value == 8
                                                  ? SetHomeAddress()
                                                  : controller.pageIndex.value ==
                                                          9
                                                      ? ShareSomeInfoAboutBedWash()
                                                      : controller.pageIndex
                                                                  .value ==
                                                              10
                                                          ? MakeItStandOut()
                                                          : controller.pageIndex
                                                                      .value ==
                                                                  11
                                                              ? WhatPlaceHasToOffer()
                                                              : controller.pageIndex
                                                                          .value ==
                                                                      12
                                                                  ? DoYouHaveAnyRestriction()
                                                                  : controller.pageIndex
                                                                              .value ==
                                                                          13
                                                                      ? AddPhotosOfHouse()
                                                                      : controller.pageIndex.value ==
                                                                              14
                                                                          ? GiveHouseTitle()
                                                                          : controller.pageIndex.value ==
                                                                                  15
                                                                              ? DescribeYourHouse()
                                                                              : controller.pageIndex.value == 16
                                                                                  ? CreateYourDescription()
                                                                                  : controller.pageIndex.value == 17
                                                                                      ? FinishUpAndPublish()
                                                                                      : controller.pageIndex.value == 18
                                                                                          ? FullDayPrice()
                                                                                          : controller.pageIndex.value == 19
                                                                                              ? UnderReview()
                                                                                              : Container(),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.pageIndex.value == 1) {
                        //controller.pageIndex.value = 2;
                        if(controller.nidPic.isEmpty) {

                          Get.showSnackbar(Ui.errorSnackBar(
                              message:"Please provide NID front page", title: 'Error'.tr));
                        } else {
                          // if(controller.userData.value.nid == null){
                          //   Get.showSnackbar(Ui.errorSnackBar(
                          //       message:"Please provide valid NID image", title: 'Error'.tr));
                          // }else {
                            controller.pageIndex.value = 2;

                       //   }
                        }
                      } else if (controller.pageIndex.value == 2) {
                        if (controller.type_of_property.isEmpty) {
                          Get.showSnackbar(Ui.errorSnackBar(
                              message: "Please select property type",
                              title: 'Error'.tr));
                        } else {

                            controller.pageIndex.value = 3;


                        }
                      }  else if (controller.pageIndex.value == 3) {
                        controller.pageIndex.value = 4;
                      } else if (controller.pageIndex.value == 4) {
                        controller.pageIndex.value = 5;
                      } else if (controller.pageIndex.value == 5) {
                        print("my page index is ${controller.pageIndex.value}");
                        if (controller.listingType.value.isEmpty) {
                          Get.showSnackbar(Ui.errorSnackBar(
                              message: "Please select a type",
                              title: 'Error'.tr));
                        } else {
                          controller.pageIndex.value = 6;
                        }
                      } else if (controller.pageIndex.value == 6) {
                        controller.pageIndex.value = 7;
                      } else if (controller.pageIndex.value == 7) {
                        controller.pageIndex.value = 8;
                      } else if (controller.pageIndex.value == 8) {
                        if (controller.streetAddress.value.text.isEmpty ||
                            controller.zip.value.text.isEmpty || controller.districtId.value.isEmpty ) {
                          Get.showSnackbar(Ui.errorSnackBar(
                              message: "Please fill all the field",
                              title: 'Error'.tr));
                        } else {
                          controller.pageIndex.value = 9;
                        }
                      } else if (controller.pageIndex.value == 9) {
                        if (controller.numbedRooms.value == 0 &&
                            controller.numGuest.value == 0 &&
                            controller.numBeds.value == 0 &&
                            controller.numBath.value == 0) {
                          Get.showSnackbar(Ui.errorSnackBar(
                              message: "Please increase atleast a number",
                              title: 'Error'.tr));
                        } else {
                          controller.pageIndex.value = 10;
                        }
                      } else if (controller.pageIndex.value == 10) {
                        controller.pageIndex.value = 11;
                      } else if (controller.pageIndex.value == 11) {
                        controller.pageIndex.value = 12;
                      } else if (controller.pageIndex.value == 12) {
                        controller.pageIndex.value = 13;
                      } else if (controller.pageIndex.value == 13) {
                        if (controller.listingImagesBase64.length < 2) {
                          Get.showSnackbar(Ui.errorSnackBar(
                              message: "Please add atleast 5 photos",
                              title: 'Error'.tr));
                        } else {
                          controller.pageIndex.value = 14;
                        }
                      } else if (controller.pageIndex.value == 14) {
                        if (controller.houseTitle.value.text.isEmpty) {
                          Get.showSnackbar(Ui.errorSnackBar(
                              message: "Please give title", title: 'Error'.tr));
                        } else {
                          controller.pageIndex.value = 15;
                        }
                      } else if (controller.pageIndex.value == 15) {
                        controller.pageIndex.value = 16;
                      } else if (controller.pageIndex.value == 16) {
                        controller.pageIndex.value = 17;
                      } else if (controller.pageIndex.value == 17) {
                        controller.pageIndex.value = 18;
                      } else if (controller.pageIndex.value == 18) {
                        if (controller.listingPrice.value.text.isEmpty) {
                          Get.showSnackbar(Ui.errorSnackBar(
                              message: "Please give an amount",
                              title: 'Error'.tr));
                        } else {
                          controller.addListingController();
                        }
                      } else if (controller.pageIndex.value == 19) {
                        controller.refreshController();

                        Get.toNamed(Routes.BASE);
                      }
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: 50,
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                            color: AppColors.textColorGreen,
                            borderRadius: BorderRadius.circular(50)),
                        alignment: Alignment.center,
                        child: controller.pageIndex.value == 18
                            ? controller.loading.value == true
                                ? CircularProgressIndicator()
                                : Text(
                                    "Publish",
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: 15,
                                    ),
                                  )
                            : Text(
                                "Continue",
                                style: TextStyle(
                                  color: AppColors.backgroundColor,
                                  fontSize: 15,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
