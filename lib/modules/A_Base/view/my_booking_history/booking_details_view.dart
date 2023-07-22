import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class MyBookingDetailsView extends GetView<HomeController> {
  const MyBookingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child:  Column(
          children: [
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.bottomLeft,
              // color: AppColors.backgroundColor,
              child: Image.asset(
                'assets/images/jayga_logo.png',
                height: 70,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.appBackGroundBrn,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      // color: AppColors.backgroundColor,
                      child: Image.asset(
                        'assets/images/demo_room1.png',
                         height: MediaQuery.of(context).size.height *.2,
                         width: MediaQuery.of(context).size.width *.2,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Booking Details:",
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black54),),
                          Text("2 Bed 2 Bath Apartment",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                          Text("Uttara, Dhaka",
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color:AppColors.textColorGreen),),

                        ],
                      ),
                    )
                  ],
                ),

                Container(
                  width: MediaQuery.of(context).size.width ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Check In Time:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                      Text("12:00 PM 12th August 2023",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black54),),
                      Text("Check Out Time:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                      Text("12:00 PM 17th August 2023",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black54),),
                      SizedBox(height: 10,),
                      Text("Want to change the date?",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: AppColors.textColorGreen),),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text("Location",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black54),),

                Text("View on map:",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: AppColors.textColorGreen),),
                Container(
                  // color: AppColors.backgroundColor,
                  child: Image.asset(
                    'assets/images/map.png',
                    height: MediaQuery.of(context).size.height *.2,
                    width: MediaQuery.of(context).size.width ,
                  ),
                ),
                SizedBox(height: 10,),
                Divider(),
                ListTile(
                  title: Text("Kaif Shiam", style: TextStyle(fontSize: 22),),
                  subtitle: Text("Hosted by"),
                  trailing: Container(
                    height: 100,
                   width: 100,
                   decoration: BoxDecoration(
                        shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/kaif.png"))),
                    // color: AppColors.backgroundColor,

                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange,),
                    Text("15 host reviews", style: TextStyle(fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.verified_user, color: Colors.green,),
                    Text("Identity Verified", style: TextStyle(fontSize: 15),),
                  ],
                ),
                InkWell(
                  onTap: () {
                    //  Get.toNamed(Routes.HOME);
                    //controller.visible.value++;
                    // controller.loginController();
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: controller.visible.value == 1 ? 50 : 40,
                    width: controller.visible.value == 1 ? 50 : 140,
                    decoration: BoxDecoration(
                        color: AppColors.textColorGreen,
                        borderRadius: BorderRadius.circular(
                            controller.visible.value == 1 ? 60 : 50)),
                    alignment: Alignment.center,
                    child: controller.visible.value == 1
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                      "Contact Host",
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(),
                Text(
                  "Host Restriction",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Divider(),
                Text(
                  "Cancelation Policy",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );


  }
}
