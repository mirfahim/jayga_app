import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class ConfirmAndPayView extends GetView<BookingController> {
  const ConfirmAndPayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
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
        child: Obx(
                () {
              return controller.seeAmenities.value == false ?
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

                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "2 Bed 2 Bath Apartment",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "2000tk",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: AppColors.textColorGreen),
                                      ),
                                      Text(
                                        "/Night",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Center(
                                child: Text(
                                    "Flat: 3B, House: 27, Road: 18, Dhanmondi, Dhaka")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("800 sqft"),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.bed,
                                      ),
                                      Text("1"),
                                      Icon(
                                        Icons.bed,
                                      ),
                                      Text("1"),
                                      Icon(
                                        Icons.bed,
                                      ),
                                      Text("1"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    //  Get.toNamed(Routes.HOME);
                                    //controller.visible.value++;
                                    // controller.loginController();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 2),
                                    height:  20,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50)),
                                    alignment: Alignment.center,
                                    child:  Text(
                                      "3D Tour",
                                      style: TextStyle(
                                        color: AppColors.backgroundColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Short Stay is available for this place",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Max Guest:4",  style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),),
                                    SizedBox(width: 10,),
                                    Container(
                                      color: Colors.grey,
                                      height: 10,
                                      width: 2,
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Bed Room:4",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),),
                                    SizedBox(width: 10,),
                                    Container(
                                      color: Colors.grey,
                                      height: 10,
                                      width: 2,
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Bathroom:4",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Max Guest:4",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),),
                                    SizedBox(width: 10,),
                                    Container(
                                      color: Colors.grey,
                                      height: 10,
                                      width: 2,
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Bed Room:4",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),),
                                    SizedBox(width: 10,),
                                    Container(
                                      color: Colors.grey,
                                      height: 10,
                                      width: 2,
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Bathroom:4",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.textColorWhite,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColors.textColorGreen, width: 2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_sharp,
                                        color: AppColors.textColorGreen,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              "Single Room",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: AppColors.textColorGreen),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.textColorWhite,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColors.textColorGreen, width: 2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_sharp,
                                        color: AppColors.textColorGreen,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              "Single Room",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: AppColors.textColorGreen),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.textColorWhite,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColors.textColorGreen, width: 2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_sharp,
                                        color: AppColors.textColorGreen,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              "Single Room",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: AppColors.textColorGreen),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.textColorWhite,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColors.textColorGreen, width: 2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_sharp,
                                        color: AppColors.textColorGreen,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              "Single Room",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: AppColors.textColorGreen),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.textColorWhite,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColors.textColorGreen, width: 2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle_sharp,
                                        color: AppColors.textColorGreen,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              "Single Room",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: AppColors.textColorGreen),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            InkWell(
                              onTap: (){

                                controller.seeAmenities.value = true;






                              },
                              child: Center(
                                child: Text(
                                  "All Alemnities",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColors.textColorGreen),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    "Jayga",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: AppColors.textColorGreen),
                                  ),
                                  Text(
                                    " Protect",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                "Every booking includes free protection from Host cancellations, listing inaccuracies, and other issues like trouble checking in.",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black54),
                              ),
                            ),
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black54),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black54),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                    height: 15,
                                    width: 2,
                                    color: Colors.black54
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "54 reviews",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: AppColors.textColorGreen),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 140,
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Cleanness", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                      ),
                                      Row(
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 2),
                                            height: 20,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                color: AppColors.textColorGreen,
                                                borderRadius: BorderRadius.circular(50)),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: 5,),
                                          Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Communication", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                      ),
                                      Row(
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 2),
                                            height: 20,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                color: AppColors.textColorGreen,
                                                borderRadius: BorderRadius.circular(50)),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: 5,),
                                          Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Check-in", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                      ),
                                      Row(
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 2),
                                            height: 20,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                color: AppColors.textColorGreen,
                                                borderRadius: BorderRadius.circular(50)),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: 5,),
                                          Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Accuracy", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                      ),
                                      Row(
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 2),
                                            height: 20,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                color: AppColors.textColorGreen,
                                                borderRadius: BorderRadius.circular(50)),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: 5,),
                                          Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Location", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                      ),
                                      Row(
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 2),
                                            height: 20,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                color: AppColors.textColorGreen,
                                                borderRadius: BorderRadius.circular(50)),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: 5,),
                                          Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Value", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                      ),
                                      Row(
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 2),
                                            height: 20,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                color: AppColors.textColorGreen,
                                                borderRadius: BorderRadius.circular(50)),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(width: 5,),
                                          Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: Text(
                                "Highlighted reviews",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            Divider(thickness: 2,),
                            ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    "Kaif Shiam",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.orange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,

                                    color: Colors.orange,
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "April 2023",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black54),
                                  ),
                                  Text(
                                    "Loved every minute and would definitely come back",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                                  ),
                                ],
                              ),
                              leading: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/kaif.png"))),
                                // color: AppColors.backgroundColor,
                              ),
                            ),
                            Divider(thickness: 1,),

                            ListTile(
                              title: Text(
                                "Kaif Shiam",
                                style: TextStyle(fontSize: 22),
                              ),
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
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Text(
                                  "15 host reviews",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.verified_user,
                                  color: Colors.green,
                                ),
                                Text(
                                  "Identity Verified",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Divider(),
                            InkWell(
                              onTap: () {
                                //  Get.toNamed(Routes.HOME);
                                //controller.visible.value++;
                                // controller.loginController();
                              },
                              child: Center(
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 2),
                                  height: 40,
                                  width:  MediaQuery.of(context).size.width -100,
                                  decoration: BoxDecoration(
                                      color: AppColors.textColorGreen,
                                      borderRadius: BorderRadius.circular(50)),
                                  alignment: Alignment.center,
                                  child:  Text(
                                    "Get Support",
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black54),
                            ),
                            Text(
                              "View on map:",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: AppColors.textColorGreen),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              // color: AppColors.backgroundColor,
                              child: Image.asset(
                                'assets/images/map.png',
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            SizedBox(height: 20,),



                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
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
                            Row(
                              children: [
                                Icon(
                                  Icons.flag,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Report this posting",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ) : AllAlemnitiesView();
            }
        ),
      ),
    );
  }
}
