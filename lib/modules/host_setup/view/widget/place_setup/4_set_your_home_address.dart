import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class SetHomeAddress extends GetView<HostController> {
  const SetHomeAddress({Key? key}) : super(key: key);

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
                        "Set your home address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      Text(
                        "Set your street address, town and district so people can easily find your property.",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: TextFormField(

                          maxLines: 1,
                          controller: controller.nameController.value,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: AppColors.jaygaWhite,
                            focusColor: Colors.white,
                            labelText: 'Street address',
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
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: TextFormField(

                          maxLines: 1,
                          controller: controller.nameController.value,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: AppColors.jaygaWhite,
                            focusColor: Colors.white,
                            labelText: 'Town',
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
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: TextFormField(

                          maxLines: 1,
                          controller: controller.nameController.value,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: AppColors.jaygaWhite,
                            focusColor: Colors.white,
                            labelText: 'District/City',
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
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: TextFormField(

                          maxLines: 1,
                          controller: controller.nameController.value,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: AppColors.jaygaWhite,
                            focusColor: Colors.white,
                            labelText: 'Zip Code/ Postal Code',
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
        ),


    );

  }
}