import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class NidFormView extends GetView<HostController> {
  const NidFormView({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please complete your account details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please complete your account information to host your own place.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        Row(

                          children: [

                            Text(
                              "1.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .09,
                              width: MediaQuery.of(context).size.height * .4,
                              decoration: BoxDecoration(
                                  color: AppColors.jaygaTextFldColor,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),

                                child: TextFormField(

                                  maxLines: 1,
                                  controller: controller.nameController.value,
                                  decoration: new InputDecoration(
                                    filled: true,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    fillColor: AppColors.jaygaTextFldColor,
                                    focusColor: Colors.white,
                                    labelText: 'Attach Your NID',
                                    suffixIcon: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(

                                            fit: BoxFit.fitHeight,
                                            image: AssetImage(
                                              'assets/icons/tick.png',

                                            ),
                                          )),
                                    ),
                                    prefixIcon:  Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/document.png',
                                            ),
                                          )),
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
                        SizedBox(
                          height: 30,
                        ),
                        Row(

                          children: [
                            Text(
                              "2.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .09,
                              width: MediaQuery.of(context).size.height * .4,
                              decoration: BoxDecoration(
                                  color: AppColors.jaygaTextFldColor,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),

                                child: TextFormField(

                                  maxLines: 1,
                                  controller: controller.nameController.value,
                                  decoration: new InputDecoration(
                                    filled: true,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    fillColor: AppColors.jaygaTextFldColor,
                                    focusColor: Colors.white,
                                    labelText: 'Take Selfie',
                                    suffixIcon: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/tick.png',
                                            ),
                                          )),
                                    ),
                                    prefixIcon:  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/camera.png',
                                            ),
                                          )),
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
                        SizedBox(
                          height: 30,
                        ),
                        Row(

                          children: [
                            Text(
                              "3.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .09,
                              width: MediaQuery.of(context).size.height * .4,
                              decoration: BoxDecoration(
                                  color: AppColors.jaygaTextFldColor,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),

                                child: TextFormField(

                                  maxLines: 1,
                                  controller: controller.nameController.value,
                                  decoration: new InputDecoration(
                                    filled: true,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    fillColor: AppColors.jaygaTextFldColor,
                                    focusColor: Colors.white,
                                    labelText: 'Attach a utility bill copy',
                                    suffixIcon: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/tick.png',
                                            ),
                                          )),
                                    ),
                                    prefixIcon:  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/icons/document.png',
                                            ),
                                          )),
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
