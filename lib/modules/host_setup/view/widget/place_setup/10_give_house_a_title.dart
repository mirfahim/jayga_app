import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class GiveHouseTitle extends GetView<HostController> {
  const GiveHouseTitle({Key? key}) : super(key: key);
//page14
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
                        "Now, let’s give your house a title",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        "Short titles work best. Have fun with it - you can always change it later",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: TextFormField(

                          maxLines: 3,
                          controller: controller.houseTitle.value,
                          decoration: new InputDecoration(
                            hintText: "Lovely 2 bed apartment near, uttara sector 7 park",
                            filled: true,
                            fillColor: AppColors.jaygaWhite,
                            focusColor: Colors.white,
                            labelText: 'Lovely 2 bed apartment near, uttara sector 7 park',
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
