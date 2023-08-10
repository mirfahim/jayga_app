import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class WhatPlaceHasToOffer extends GetView<HostController> {
  const WhatPlaceHasToOffer({Key? key}) : super(key: key);

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
                height: MediaQuery.of(context).size.height *.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ListView(

                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tell guests what your place has to offer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        "You’ll add more details later, such as bed types.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Wifi")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("TV")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Kitchen")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Washing Machine")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Free parking on premises")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Breakfast included")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Air conditioning")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Dedicated workspace")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Text(
                        "Do you have any standout amenities?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Pool")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Hot tub")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Patio")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("BBQ grill")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Outdoor dining area")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Fire pit")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Gym")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Beach/Lake access")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Text(
                        "Do you have any of these safety items?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Smoke alarm")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("First aid kit")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(

                                            fit: BoxFit.fill,
                                            image: AssetImage(

                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("Fire extinguisher")
                                  ],
                                ),
                              )
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *.1,
                              width: MediaQuery.of(context).size.width *.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/cabin.png',
                                            ),
                                          )),
                                    ),
                                    Text("CCTV")
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        )


    );

  }
}
