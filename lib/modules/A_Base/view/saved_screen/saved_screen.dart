import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
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
                  // CircleAvatar(
                  //   backgroundColor: AppColors.textColorGreen,
                  //   radius: 12,
                  //     child: Icon(Icons.add)),
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
controller.startExplore.value = true;

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
              controller.startExplore.value == false ? Container():
              Container(
                height: MediaQuery.of(context).size.height * .5,
                child: ListView.builder(

                  scrollDirection: Axis.vertical,
                  itemCount: Get.find<BookingController>().searchString.value.isNotEmpty? Get.find<BookingController>().filteredListingList.where((element) => element.listingType == "").length : Get.find<BookingController>().filteredListingListFromFilter.length,

                  itemBuilder: (BuildContext context, index) {
                    var data =  Get.find<BookingController>().searchString.value.isNotEmpty? Get.find<BookingController>().filteredListingList[index] : Get.find<BookingController>().filteredListingListFromFilter[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          // controller.getReviewController(data.listingId);
                          //
                          // controller.listingDataguestNum.value = data.guestNum;
                          // controller.listingDatabedNum.value= data.bedNum;
                          // controller.listingDatabathroomNum.value= data.bathroomNum;
                          // controller.listingDatalistingTitle.value= data.listingTitle;
                          // controller.listingDatalistingDescription.value= data.listingDescription;
                          //
                          // controller.listingDatalistingAddress.value= data.listingAddress;
                          // controller.listingDatadistrict.value= data.district;
                          // controller.listingDatatown.value= data.town;
                          // controller.listingDatazipCode.value= data.zipCode;
                          //
                          // controller.listingDatadescribePeaceful.value= data.describePeaceful;
                          // controller.listingDatadescribeUnique.value= data.describeUnique;
                          // controller.listingDatadescribeFamilyfriendly.value= data.describeFamilyfriendly;
                          // controller.listingDatadescribeStylish.value= data.describeStylish;
                          // controller.listingDatadescribeCentral.value= data.describeCentral;
                          // controller.dlistingDataescribeSpacious.value= data.describeSpacious;
                          // controller.listingDataprivateBathroom.value= data.privateBathroom;
                          // controller.listingDatadoorLock.value= data.doorLock;
                          // controller.listingDatabreakfastIncluded.value= data.breakfastIncluded;
                          // controller.listingDataunknownGuestEntry.value= data.unknownGuestEntry;
                          // controller.listingDatalistingType.value=data.listingType;
                          // controller.listingDatawifi.value= data.amenities.wifi;
                          // controller.listingDatatv.value= data.amenities.tv;
                          // controller.listingDatakitchen.value= data.amenities.kitchen;
                          // controller.listingDatawashingMachine.value= data.amenities.washingMachine;
                          // controller.listingDatafreeParking.value=data.amenities.freeParking;
                          //
                          //
                          // Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [index]);
                        },
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
                                            child: Text(data.listingTitle,maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                                        Text("4.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ],
                                    ),
                                    Text(data.listingDescription),
                                    SizedBox(height: 10,),
                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 12),),
                                        Text("৳${data.fullDayPriceSetByUser} total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
