import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/services/firebase_service.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GroupTourPackageListView extends GetView<BookingController> {
  const GroupTourPackageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child:  Column(
          children: [
            SizedBox(height: 20,),
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
      backgroundColor: AppColors.appBackGroundBrn,
      body: Obx(() {
          return SingleChildScrollView(

            //physics: ScrollPhy,
            child: RefreshIndicator(
              onRefresh: controller.checkInternetConnectivity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //height: MediaQuery.of(context).size.height *2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Filter Group Tour",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: (){
                              Get.toNamed(Routes.SEARCHPAGE);
                            },
                            child: Image.asset(
                              'assets/icons/filter.png',
                              // height: MediaQuery.of(context).size.height *.5,
                              // width: MediaQuery.of(context).size.width *.9,
                            ),
                          ),
                        ],
                      ),


                      Container(
                        height: MediaQuery.of(context).size.height * 6,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(), // new
                          scrollDirection: Axis.vertical,
                          itemCount: controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "appartment" || element.listingType == "room" || element.listingType == "Flat"|| element.listingType == "apartment" || element.listingType == "House").length : controller.filteredListingListFromFilter.where((element) => element.listingType == "appartment"|| element.listingType == "Flat"||element.listingType == "room" || element.listingType == "apartment"|| element.listingType == "House").length,

                          itemBuilder: (BuildContext context, index) {
                            var data =  controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "appartment" || element.listingType == "Flat"||element.listingType == "room" || element.listingType == "apartment"|| element.listingType == "House").toList()[index] : controller.filteredListingList.where((element) => element.listingType == "appartment" || element.listingType == "Flat"||element.listingType == "room" || element.listingType == "apartment"|| element.listingType == "House").toList()[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  print("index is $index");
                                  controller.getReviewController(data.listingId);

                                  controller.listingDataguestNum.value = data.guestNum;
                                  controller.listingDatabedNum.value= data.bedNum;
                                  controller.listingDatabathroomNum.value= data.bathroomNum;
                                  controller.listingDatalistingTitle.value= data.listingTitle;
                                  controller.listingDatalistingDescription.value= data.listingDescription;

                                  controller.listingDatalistingAddress.value= data.listingAddress;
                                  controller.listingDatadistrict.value= data.district;
                                  controller.listingDatatown.value= data.town;
                                  controller.listingDatazipCode.value= data.zipCode;

                                  controller.listingDatadescribePeaceful.value= data.describePeaceful;
                                  controller.listingDatadescribeUnique.value= data.describeUnique;
                                  controller.listingDatadescribeFamilyfriendly.value= data.describeFamilyfriendly;
                                  controller.listingDatadescribeStylish.value= data.describeStylish;
                                  controller.listingDatadescribeCentral.value= data.describeCentral;
                                  controller.dlistingDataescribeSpacious.value= data.describeSpacious;
                                  controller.listingDataprivateBathroom.value= data.privateBathroom;
                                  controller.listingDatadoorLock.value= data.doorLock;
                                  controller.listingDatabreakfastIncluded.value= data.breakfastIncluded;
                                  controller.listingDataunknownGuestEntry.value= data.unknownGuestEntry;
                                  controller.listingDatalistingType.value=data.listingType;
                                  controller.listingDatawifi.value= data.amenities.wifi;
                                  controller.listingDatatv.value= data.amenities.tv;
                                  controller.listingDatakitchen.value= data.amenities.kitchen;
                                  controller.listingDatawashingMachine.value= data.amenities.washingMachine;
                                  controller.listingDatafreeParking.value=data.amenities.freeParking;


                                  Get.toNamed(Routes.GROUPTOURDETAILS, arguments: [data]);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: AppColors.textColorGreen, width: 1),
                                    color: AppColors.appBackGroundBrn,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: MediaQuery.of(context).size.height*.25,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.transparent, width: 2),
                                            color: AppColors.appBackGroundBrn,
                                          ),
                                          child: CarouselSlider(
                                            options: CarouselOptions(height: 400.0),
                                            items: data.images.map((i) {
                                              print("all images are ${data.images.length}");
                                              return Builder(
                                                builder: (BuildContext context) {
                                                  return Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.transparent
                                                    ),
                                                    child:   CachedNetworkImage(
                                                      //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                      imageUrl: "https://new.jayga.io/uploads/listings/${i.listingFilename}",
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
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          )

                                      ),
                                      SizedBox(height: 10,),
                                      Card(
                                        color: AppColors.appBackGroundBrn,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                              SizedBox(
                                                      height: MediaQuery.of(context).size.height*.05,
                                                      child: Text("Group tour title",maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                                                  RichText(
                                                    text:  TextSpan(text: '৳${data.fullDayPriceSetByUser}',
                                                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorBlack, fontSize: 14),
                                                        children: [
                                                          TextSpan(
                                                            text: '/head',
                                                            style: TextStyle(color: Colors.black54, fontSize: 12)

                                                          )
                                                        ]),
                                                  ),


                                                ],
                                              ),
                                              Text("Group size 14 people", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12)),

                                              Text("Destination and tour place"),
                                              Text("Start from Dec 16 to 21 Dec 2023"),
                                              SizedBox(height: 10,),
                                              Row(

                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text:  TextSpan(text: '${data.bedNum}',
                                                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorBlack, fontSize: 14),
                                                        children: [
                                                          TextSpan(
                                                              text: 'Night',
                                                              style: TextStyle(color: Colors.black54, fontSize: 12)

                                                          )
                                                        ]),
                                                  ),
                                                  RichText(
                                                    text:  TextSpan(text: '${data.bathroomNum}',
                                                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColorBlack, fontSize: 14),
                                                        children: [
                                                          TextSpan(
                                                              text: 'days',
                                                              style: TextStyle(color: Colors.black54, fontSize: 12)

                                                          )
                                                        ]),
                                                  ),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),



                    ],
                  ),
                ),
              ),
            ),
          );
        }),

    );
  }
}