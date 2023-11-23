import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class AllAlemnitiesView extends GetView<BookingController> {
  const AllAlemnitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.appBackGroundBrn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "See All amenties available",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  InkWell(
                      onTap: () {
                        controller.seeAmenities.value = false;
                      },
                      child: Icon(
                        Icons.cancel_outlined,
                        size: 30,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Home Service",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                        controller.listingDatawifi.value == "0" ? Container():  ListTile(
                          title:  Text("Wifi"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/wifi.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatakitchen.value == "0" ? Container():  ListTile(
                          title:  Text("Kitchen"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/kitchen-table.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatatv.value == "0" ? Container():  ListTile(
                          title:  Text("TV"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/television.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatawashingMachine.value == "0" ? Container():  ListTile(
                          title:  Text("Washing Machine"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/washing-machine.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        //
                        controller.listingDatafreeParking.value == "0" ? Container():  ListTile(
                          title:  Text("Free parking on premises"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/parked_car.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatabreakfastIncluded.value == "0" ? Container():  ListTile(
                          title:  Text("Breakfast included"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/kitchen-table.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDataairCondition.value == "0" ? Container():  ListTile(
                          title:  Text("Air Condition"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/television.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),

                        // Standout
                        Text(
                          "Standout amenities",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                        ),

                        controller.listingDatapool.value == "0" ? Container():  ListTile(
                          title:  Text("Pool"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/pool.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatahotTub.value == "0" ? Container():  ListTile(
                          title:  Text("HotTub"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/hottub.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatapatio.value == "0" ? Container():  ListTile(
                          title:  Text("Patio"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/patio.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatabbqGrill.value == "0" ? Container():  ListTile(
                          title:  Text("BBQ"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/bbq.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDataoutdooring.value == "0" ? Container():  ListTile(
                          title:  Text("OutDoor"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/outdoor.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatafirePit.value == "0" ? Container():  ListTile(
                          title:  Text("Fire Pit"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/fire_pit.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatabeachLakeAccess.value == "0" ? Container():  ListTile(
                          title:  Text("Lake View"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/lake.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),


                     //safety items
                        Text(
                          "Safety items",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                        ),

                        controller.listingDatasmokeAlarm.value == "0" ? Container():  ListTile(
                          title:  Text("Smoke alarm"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/smoke.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatafirstAid.value == "0" ? Container():  ListTile(
                          title:  Text("First-Aid"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/aid.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),
                        controller.listingDatacctv.value == "0" ? Container():  ListTile(
                          title:  Text("CCTV"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/cctv.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),



                        controller.listingDatafireExtinguish.value == "0" ? Container():  ListTile(
                          title:  Text("Fire Exit"),

                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/icons/host/place_offer/fire_ext.png',
                                  ),
                                )),
                          ),
                          trailing: Icon(Icons.verified, color: AppColors.textColorGreen,),
                        ),



                      ],


                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
