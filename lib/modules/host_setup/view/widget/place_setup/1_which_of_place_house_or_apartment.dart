import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class WhichOfPlace extends GetView<HostController> {
  const WhichOfPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Which of these best describes your place?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        "Select the nearest description of your residence that you want to rent out",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 30,
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
                                  Text("House")
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
                                    Text("Flat/Apartment")
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
                                    Text("Cabin")
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
                                    Text("Lounge")
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
                                    Text("Farm")
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
                                    Text("Camp site")
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
                                    Text("Hotel")
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
                                    Text("Bed & Breakfast")
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
