import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

import '../../../../routes/app_pages.dart';

class MyBookingListHISTORY extends GetView<HomeController> {
  const MyBookingListHISTORY({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Container(
            height: MediaQuery.of(context).size.height *.72,
            child: ListView.builder(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.BOOKINGDETAILSHISTORY);
                    },
                    child: Stack(

                      children: [
                        Container(
                          // color: AppColors.backgroundColor,
                          child: Image.asset(
                            'assets/images/demo_room1.png',
                            // height: MediaQuery.of(context).size.height *.5,
                            // width: MediaQuery.of(context).size.width *.9,
                          ),
                        ),

                        Positioned(
                          bottom: 10,

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Uttara, Dhaka", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                                    Row(

                                      children: [
                                        Icon(Icons.star,color: Colors.orange,),
                                        Text("5.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange)),
                                      ],
                                    ),

                                  ],
                                ),
                                Text("Elegant and modern space for rent.", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),),


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
        );


  }
}
