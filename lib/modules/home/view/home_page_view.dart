import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

import '../../../routes/app_pages.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: Obx(() {
        return SingleChildScrollView(
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
                  Text(
                    "Search Listings?",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
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
                      title: Text("Where to?"),
                      subtitle: Text("Anywhere Any Week Add Guests"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
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
                                controller.visible.value == 1 ? 60 : 40)),
                        alignment: Alignment.center,
                        child: controller.visible.value == 1
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
                initialIndex: 1,
                length: 5,
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

                        Tab(
                          icon: Image.asset(
                            'assets/icons/room.png',
                            // height: MediaQuery.of(context).size.height *.5,
                            // width: MediaQuery.of(context).size.width *.9,
                          ),
                          text: "Rooms",
                        ),
                      ],

                ),
              ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *.5,
                    child: ListView.builder(
                     // physics: const NeverScrollableScrollPhysics(), // new
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Get.toNamed(Routes.MAKEBOOKINGDETAILS);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // color: AppColors.backgroundColor,
                                  child: Image.asset(
                                    'assets/images/demo_room1.png',
                                    // height: MediaQuery.of(context).size.height *.5,
                                    // width: MediaQuery.of(context).size.width *.9,
                                  ),
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
                                            Text("Uttara, Dhaka", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                            Text("5.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                          ],
                                        ),
                                        Text("Elegant and modern space for rent. Free from 24-31 Jul."),
                                        SizedBox(height: 10,),
                                        Row(

                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("1 Bedroom + Patio + BT", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, fontSize: 16),),
                                            Text("৳749 total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
          ),
        );
      }),
    );
  }
}
