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
      body: Obx(() {
        return SingleChildScrollView(
          //physics: ScrollPhy,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //height: MediaQuery.of(context).size.height *2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Find your next place to stay",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.jaygaShadowBrwn,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading:  Image.asset(
                        'assets/icons/search.png',
                        // height: MediaQuery.of(context).size.height *.5,
                        // width: MediaQuery.of(context).size.width *.9,
                      ),
                      title:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
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
                    height: 20,
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
                        height: controller.searchLoad.value == 1 ? 50 : 60,
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
                    length: 4,
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: MediaQuery.of(context).size.height *.12,
                            width:  MediaQuery.of(context).size.width * 1,
                            child: TabBar(
                              labelColor: Colors.black,
                              tabs: [
                                Tab(

                                  icon: Image.asset(
                                    'assets/icons/room.png',
                                    // height: MediaQuery.of(context).size.height *.5,
                                    // width: MediaQuery.of(context).size.width *.9,
                                  ),
                                  text: "Rooms",

                                ),
                                Tab(
                                  icon: Image.asset(
                                    'assets/icons/cabin.png',
                                    // height: MediaQuery.of(context).size.height *.5,
                                    // width: MediaQuery.of(context).size.width *.9,
                                  ),
                                  text: "Parking",
                                ),
                                Tab(
                                  icon: Image.asset(
                                    'assets/icons/hotel.png',
                                    // height: MediaQuery.of(context).size.height *.5,
                                    // width: MediaQuery.of(context).size.width *.9,
                                  ),
                                  text: "Apartments",
                                ),
                                Tab(
                                  icon: Image.asset(
                                    'assets/icons/apartment.png',
                                    // height: MediaQuery.of(context).size.height *.5,
                                    // width: MediaQuery.of(context).size.width *.9,
                                  ),
                                  text: "Hotels",
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
                                  itemCount: controller.filteredListingList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    var data = controller.filteredListingList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          controller.getReviewController(data.listerId);

                                          Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [index]);
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
                                                            //imageUrl: "http://new.jayga.xyz/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                            imageUrl: "https://new.jayga.xyz/uploads/listings/${i.listingFilename}",
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
                                                        Text(data.listingTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                                        Text("5.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                                      ],
                                                    ),
                                                    Text(data.listingDescription),
                                                    SizedBox(height: 10,),
                                                    Row(

                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 16),),
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
                                  itemCount: controller.filteredListingList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    var data = controller.filteredListingList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          controller.getReviewController(data.listerId);

                                          Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [index]);
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
                                                            //imageUrl: "http://new.jayga.xyz/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                            imageUrl: "https://new.jayga.xyz/uploads/listings/${i.listingFilename}",
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
                                                        Text(data.listingTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                                        Text("5.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                                      ],
                                                    ),
                                                    Text(data.listingDescription),
                                                    SizedBox(height: 10,),
                                                    Row(

                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 16),),
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
                                  itemCount: controller.filteredListingList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    var data = controller.filteredListingList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          controller.getReviewController(data.listerId);

                                          Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [index]);
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
                                                            //imageUrl: "http://new.jayga.xyz/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                            imageUrl: "https://new.jayga.xyz/uploads/listings/${i.listingFilename}",
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
                                                        Text(data.listingTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                                        Text("5.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                                      ],
                                                    ),
                                                    Text(data.listingDescription),
                                                    SizedBox(height: 10,),
                                                    Row(

                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 16),),
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
                                  itemCount: controller.filteredListingList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    var data = controller.filteredListingList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          controller.getReviewController(data.listerId);

                                          Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [index]);
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
                                                            //imageUrl: "http://new.jayga.xyz/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                                            imageUrl: "https://new.jayga.xyz/uploads/listings/${i.listingFilename}",
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
                                                        Text(data.listingTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                                        Text("5.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                                      ],
                                                    ),
                                                    Text(data.listingDescription),
                                                    SizedBox(height: 10,),
                                                    Row(

                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("${data.bedNum} Bedroom + ${data.bathroomNum}Patio + ${data.bathroomNum}BT", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 16),),
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
        );
      }),
    );
  }
}