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
                      Text(
                        "You’ll add more details later, such as bed types.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),

                      Row(
                        children: [
                          Text("Guests"),
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width *.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.jaygaShadowBrwn,
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 5,),
                                Text("1"),
                                SizedBox(width: 5,),

                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.jaygaShadowBrwn,
                                  child: Icon(Icons.add),
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
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.jaygaShadowBrwn,
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 5,),
                                Text("1"),
                                SizedBox(width: 5,),

                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.jaygaShadowBrwn,
                                  child: Icon(Icons.add),
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
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.jaygaShadowBrwn,
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 5,),
                                Text("1"),
                                SizedBox(width: 5,),

                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.jaygaShadowBrwn,
                                  child: Icon(Icons.add),
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
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.jaygaShadowBrwn,
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 5,),
                                Text("1"),
                                SizedBox(width: 5,),

                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.jaygaShadowBrwn,
                                  child: Icon(Icons.add),
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
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.textColorGreen,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.textColorGreen,
                            ),
                          ),
                          Text("Yes"),
                          SizedBox(
                            height: 70,
                          ),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.textColorGreen,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.jaygaShadowBrwn,
                            ),
                          ),
                          Text("No")
                        ],
                      )

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
