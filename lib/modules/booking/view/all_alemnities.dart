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
    return  SingleChildScrollView(
        child:
             Container(
              color: AppColors.appBackGroundBrn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    // color: AppColors.backgroundColor,
                    child: Image.asset(
                      fit: BoxFit.fill,
                      'assets/images/room1.png',
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),

                    child:   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All Amenities",
                                  style: TextStyle(
                                    color: AppColors.textColorGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    controller.seeAmenities.value = false;
                                  },
                                    child: Icon(Icons.cancel_outlined, color: Colors.grey,))
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Bedroom and laundry",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(thickness: 1,),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),



                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Family",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Divider(thickness: 1,),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Heating and cooling",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Divider(thickness: 1,),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Privacy and safety",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Divider(thickness: 1,),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Internet and office",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),

                            Divider(thickness: 1,),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Kitchen and dining",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Divider(thickness: 1,),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Outdoor",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Divider(),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Parking and facilities",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),

                            Divider(),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Internet and office",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),


                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Services",
                                        style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),

                                    ],
                                  ),
SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(Icons.local_laundry_service_outlined,),
                                      Text(
                                        "washing Machine",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),


                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),

      );

  }
}
