import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class FullDayPrice extends GetView<HostController> {
  const FullDayPrice({Key? key}) : super(key: key);
//page18
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:
         Obx(
           () {
             return Container(
              color: AppColors.appBackGroundBrn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            "Now, set your full day price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          Text(
                            "You can change it anytime",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),

                                  child: Container(
                                    height: MediaQuery.of(context).size.height *.1,
                                    width: MediaQuery.of(context).size.width *.4,
                                    child: TextFormField(

                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      controller: controller.listingPrice.value,
                                      decoration: new InputDecoration(
                                        hintText: "Price",

                                        filled: true,
                                        fillColor: AppColors.jaygaWhite,
                                        focusColor: Colors.white,

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

                                ),


                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "*Places like yours price around 4000৳ per night",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black54),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height *.2,
                            width: MediaQuery.of(context).size.width *.8,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Base price",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "${controller.listingPrice.value.text} TK",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),


                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Platform fee",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "0 TK",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),


                                    ],
                                  ),
                                  Divider(thickness: 2,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Net Earnings",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        controller.listingPrice.value.text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),


                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height *.07,
                            width: MediaQuery.of(context).size.width *.8,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "You earn",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "${controller.listingPrice.value.text} Tk",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),


                                ],
                              ),
                            ),
                          ),
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
