import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class ShareSomeInfoAboutBedWash extends GetView<HostController> {
  const ShareSomeInfoAboutBedWash({Key? key}) : super(key: key);
//page9
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:
         Obx(
           () {
             return Container(
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
                            "Share some info about your place",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "You’ll add more details later, such as bed types.",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: Colors.black54),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Text("Guests"),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width *.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        if(controller.numGuest.value > 0){
                                          controller.numGuest.value --;
                                        }else {

                                        }


                              },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.jaygaShadowBrwn,
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(controller.numGuest.value.toString()),
                                    SizedBox(width: 5,),

                                    InkWell(
                                      onTap: (){
                                        controller.numGuest.value ++ ;
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.jaygaShadowBrwn,
                                        child: Icon(Icons.add),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Bedrooms"),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width *.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        if(controller.numbedRooms.value > 0){
                                          controller.numbedRooms.value --;
                                        }else {

                                        }


                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.jaygaShadowBrwn,
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(controller.numbedRooms.value.toString()),
                                    SizedBox(width: 5,),

                                    InkWell(
                                      onTap: (){
                                        controller.numbedRooms.value ++ ;
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.jaygaShadowBrwn,
                                        child: Icon(Icons.add),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Beds"),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width *.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        if(controller.numBeds.value > 0){
                                          controller.numBeds.value --;
                                        }else {

                                        }


                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.jaygaShadowBrwn,
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(controller.numBeds.value.toString()),
                                    SizedBox(width: 5,),

                                    InkWell(
                                      onTap: (){
                                        controller.numBeds.value ++ ;
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.jaygaShadowBrwn,
                                        child: Icon(Icons.add),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Bathrooms"),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width *.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        if(controller.numBath.value > 0){
                                          controller.numBath.value --;
                                        }else {

                                        }


                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.jaygaShadowBrwn,
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(controller.numBath.value.toString()),
                                    SizedBox(width: 5,),

                                    InkWell(
                                      onTap: (){
                                        controller.numBath.value ++ ;
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.jaygaShadowBrwn,
                                        child: Icon(Icons.add),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Will you allow short stay?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap:(){

                                    controller.shortStay.value = 1;


                    },
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: AppColors.textColorGreen,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: controller.shortStay.value == 1 ? AppColors.textColorGreen : AppColors.jaygaShadowBrwn,

                                  ),
                                ),
                              ),
                              Text("Yes"),
                              SizedBox(
                                height: 70,
                              ),
                              InkWell(
                                onTap:(){

                                  controller.shortStay.value = 0;


                                },
                                child:
                                CircleAvatar(
                                radius: 16,
                                backgroundColor: AppColors.textColorGreen,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: controller.shortStay.value == 0 ? AppColors.textColorGreen : AppColors.jaygaShadowBrwn,
                                ),
                              )),
                              Text("No")
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
        );
           }
         )


    );

  }
}
