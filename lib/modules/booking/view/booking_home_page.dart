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

class ExplorePageView extends GetView<BookingController> {
  const ExplorePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: WillPopScope(
        onWillPop:() async {

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
                      onPressed: () => Navigator.of(context).pop(true),
                      //return true when click on "Yes"
                      child:Text('Yes'),
                    ),
                  ],
                );
              }
          );
          return value == true;
        },
        child: Obx(() {
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
                          InkWell(
                            onTap: (){
                              Get.toNamed(Routes.LISTINGMAP);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/mapblack.png',
                                  height: MediaQuery.of(context).size.height *.04,
                                  width: MediaQuery.of(context).size.width *.08,
                                  color: AppColors.textColorGreen,

                                ),
                                Text("Jayga Map")
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              Get.toNamed(Routes.GROUPTOURLIST);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/group.png',
                                  height: MediaQuery.of(context).size.height *.04,
                                  width: MediaQuery.of(context).size.width *.08,
                                  color: AppColors.textColorGreen,
                                ),
                                Text("Group Tour")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/icons/packages.png',
                                height: MediaQuery.of(context).size.height *.04,
                                width: MediaQuery.of(context).size.width *.08,
                                color: AppColors.textColorGreen,
                              ),
                              Text("Packages")
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Get.toNamed(Routes.COMMUNITYHOME);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/community.png',
                                  height: MediaQuery.of(context).size.height *.04,
                                  width: MediaQuery.of(context).size.width *.08,
                                  color: AppColors.textColorGreen,
                                ),
                                Text("Community")
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      Text(
                        "Find your next place to stay",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Search Listings?",
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
                      Obx(
                        () {
                          return Container(
                            height: MediaQuery.of(context).size.height *.07,
                            width: MediaQuery.of(context).size.width ,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  controller.districtName.value == "" ? Container(): Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${controller.districtName.value}",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.districtName.value = "";
                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.areaName.value == "" ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "${controller.areaName.value}",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.areaName.value = "";
                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.shortStay.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Short Stay",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.searchPetsInt.value = 0;
                                                controller.searchPets.value = false;

                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.searchGymInt.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Gym",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.searchGymInt.value = 0;
                                                controller.searchGym.value = false;

                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.searchPoolInt.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Pool",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.searchPoolInt.value = 0;
                                                controller.searchPool.value = false;
                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.searchAcInt.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "AC",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.searchAcInt.value = 0;
                                                controller.searchAc.value = false;
                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.searchParkingInt.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Parking",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.searchParkingInt.value = 0;
                                                controller.searchParking.value = false;
                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.searchWorkSpaceInt.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "WorkSpace",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.searchWorkSpaceInt.value = 0;
                                                controller.searchWorkSpace.value = false;

                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.searchNightInt.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Night Entry",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.searchNightInt.value = 0;
                                                controller.searchNightEntry.value = false;

                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.searchPetsInt.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Pets",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                controller.searchPetsInt.value = 0;
                                                controller.searchPets.value = false;

                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.searchAddiInt.value == 0 ? Container():Card(
                                    color: AppColors.buttonColorYellow,
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height:  30,
                                      width: MediaQuery.of(context).size.width *.2,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColorYellow,
                                          borderRadius: BorderRadius.circular(
                                              controller.searchLoad.value == 1 ? 60 : 40)),
                                      alignment: Alignment.center,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.12,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              "Guest",
                                              style: TextStyle(
                                                color: AppColors.backgroundColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          InkWell(






                                              onTap: (){
                                                controller.searchAddiInt.value = 0;
                                                controller.searchAddiGuest.value = false;

                                              },
                                              child: Icon(Icons.cancel, color: AppColors.textColorGreen,))
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );
                        }
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.jaygaShadowBrwn,
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          leading:  Image.asset(
                            'assets/icons/search.png',
                             height: MediaQuery.of(context).size.height *.04,
                             width: MediaQuery.of(context).size.width *.08,
                          ),
                          title:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              child: TextField(
                                onChanged: (e) {
                                  controller.setSearchText(e);
                                  // controller.contactsResult.value =
                                  //     _search(controller.contacts.value);
                                },
                                controller: controller.searchController.value,
                                decoration: InputDecoration(
                                    labelText: "Search Your Place",
                                    hintText: "Search Your Place",

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)))),
                              ),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            FirebaseService().logCustomEvent();
                            //  Get.toNamed(Routes.HOME);
                            //controller.visible.value++;
                            // controller.loginController();
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            height: controller.searchLoad.value == 1 ? 40 : 45,
                            width: controller.searchLoad.value == 1 ? 50 : 140,
                            decoration: BoxDecoration(
                                color: AppColors.textColorGreen,
                                borderRadius: BorderRadius.circular(
                                    controller.searchLoad.value == 1 ? 60 : 40)),
                            alignment: Alignment.center,
                            child: controller.searchLoad.value == 1
                                ? Center(child: CircularProgressIndicator())
                                : Text(
                              "Search",
                              style: TextStyle(
                                color: AppColors.backgroundColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultTabController(
                        initialIndex: 0,
                        length: 5,
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                height: MediaQuery.of(context).size.height *.11,
                                width:  MediaQuery.of(context).size.width * 1.2,
                                child: TabBar(
                                  labelColor: Colors.black,
                                  tabs: [
                                    Tab(

                                      icon: Image.asset(
                                        'assets/icons/room.png',
                                         height: MediaQuery.of(context).size.height *.05,
                                        width: MediaQuery.of(context).size.width *.08,
                                      ),
                                      text: "Rooms",

                                    ),

                                    Tab(
                                      icon: Image.asset(
                                        'assets/icons/host/place_type/hotel.png',
                                        height: MediaQuery.of(context).size.height *.05,
                                        width: MediaQuery.of(context).size.width *.08,
                                      ),
                                      text: "Apartments",
                                    ),
                                    Tab(
                                      icon: Image.asset(
                                        'assets/icons/host/place_type/apartment.png',
                                        height: MediaQuery.of(context).size.height *.05,
                                        width: MediaQuery.of(context).size.width *.08,
                                      ),
                                      text: "Hotels",
                                    ),
                                    Tab(
                                      icon: Image.asset(
                                        'assets/icons/host/place_type/farm.png',
                                        height: MediaQuery.of(context).size.height *.05,
                                        width: MediaQuery.of(context).size.width *.08,
                                      ),
                                      text: "Farm",
                                    ),
                                    Tab(
                                      icon: Image.asset(
                                        'assets/icons/host/place_type/lounge.png',
                                        height: MediaQuery.of(context).size.height *.05,
                                        width: MediaQuery.of(context).size.width *.08,
                                      ),
                                      text: "Lounge",
                                    ),


                                  ],

                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 6,
                              child: TabBarView(
                                children: [

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


                                              Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [data]);
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

                                  Container(
                                    height: MediaQuery.of(context).size.height * 6,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "appartment" || element.listingType == "Flat"|| element.listingType == "apartment").length : controller.filteredListingListFromFilter.where((element) => element.listingType == "appartment"|| element.listingType == "Flat"|| element.listingType == "apartment").length,

                                      itemBuilder: (BuildContext context, index) {
                                        var data =  controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "appartment" || element.listingType == "Flat"|| element.listingType == "apartment").toList()[index] : controller.filteredListingList.where((element) => element.listingType == "appartment" || element.listingType == "Flat"|| element.listingType == "apartment").toList()[index];
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


                                              Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [data]);
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
                                  Container(
                                    height: MediaQuery.of(context).size.height * 6,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "Hotel" || element.listingType == "hotel").length : controller.filteredListingListFromFilter.where((element) => element.listingType == "Hotel"|| element.listingType == "hotel").length,

                                      itemBuilder: (BuildContext context, index) {
                                        var data =  controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "Hotel" || element.listingType == "hotel").toList()[index] : controller.filteredListingList.where((element) => element.listingType == "Hotel" || element.listingType == "hotel").toList()[index];
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


                                              Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [data]);
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
                                  Container(
                                    height: MediaQuery.of(context).size.height * 6,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "Farm" ).length : controller.filteredListingListFromFilter.where((element) => element.listingType == "Farm").length,

                                      itemBuilder: (BuildContext context, index) {
                                        var data =  controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "Farm" ).toList()[index] : controller.filteredListingList.where((element) => element.listingType == "Farm" ).toList()[index];
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


                                              Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [data]);
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
                                  Container(
                                    height: MediaQuery.of(context).size.height * 6,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(), // new
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "Lounge" ).length : controller.filteredListingListFromFilter.where((element) => element.listingType == "Lounge").length,

                                      itemBuilder: (BuildContext context, index) {
                                        var data =  controller.searchString.value.isNotEmpty? controller.filteredListingList.where((element) => element.listingType == "Lounge" ).toList()[index] : controller.filteredListingList.where((element) => element.listingType == "Lounge" ).toList()[index];
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


                                              Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [data]);
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
                            ),


                          ],
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
      ),
    );
  }
}