import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../controller/booking_controller.dart';

class GiveReviewScreen extends GetView<BookingController> {
  const GiveReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments[0];
    var data = controller.historyList[index];
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
                          Text("${data.listing.bedNum.toString()} Bed, ${data.listing.bathroomNum.toString()} Bath",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                          Text("Uttara, Dhaka",
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color:AppColors.textColorGreen),),

                        ],
                      ),
                    )
                  ],
                ),


                SizedBox(height: 10,),
                Text(
                  "Rating",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
        Center(
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
                SizedBox(height: 10,),
                Text(
                  "Experience",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),

                  child: TextFormField(

                    maxLines: 10,
                    //controller: controller.nameController.value,
                    decoration: new InputDecoration(
                     // hintText: "Please share your Experience",
                      filled: true,
                      fillColor: AppColors.jaygaWhite,
                      focusColor: Colors.white,
                      labelText: 'Please share your Experience',
                      // suffixIcon: Icon(
                      //   Icons.email_outlined,
                      // ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty)
                        return "Email is Required";
                      else if (!GetUtils.isEmail(value.trim()))
                        return "Please enter valid email";
                      else
                        return null;
                    },
                  ),

                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {



                    controller.makeReview();

                  },
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: controller.visibleReview.value == 1 ? 40 : 60,
                      width: controller.visibleReview.value == 1
                          ? MediaQuery.of(context).size.width * .3
                          : MediaQuery.of(context).size.width * .5,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColorYellow,
                          borderRadius: BorderRadius.circular(
                              controller.visibleReview.value == 1 ? 60 : 10)),
                      alignment: Alignment.center,
                      child: controller.visibleReview.value == 1
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                        "Save Review",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
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
