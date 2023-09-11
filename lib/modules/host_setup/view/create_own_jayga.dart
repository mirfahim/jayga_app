import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:jayga/utils/ui_support.dart';

import '../../../routes/app_pages.dart';

class CreateOwnJaygaView extends GetView<HostController> {
  const CreateOwnJaygaView({Key? key}) : super(key: key);

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
        child: Obx(() {
          return controller.seeAmenities.value == false
              ? Container(
            color: AppColors.appBackGroundBrn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              SizedBox(height: 40,),
                Container(
                  height: MediaQuery.of(context).size.height *.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: AssetImage("assets/images/host1.png")
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Create your own jayga!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * .8,
                          child: Text(
                            "Setup your own available space for renting to start earning through Jayga.",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 22,
                                color: Colors.black54),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),





                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.term.value == false
                                ?  InkWell(
                              onTap:(){
                                controller.term.value = true;
                  },
                                  child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AppColors.textColorBlack, width: 1),

                                  )),
                                ) :
                            InkWell(
                              onTap: (){
                                controller.term.value = false;
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/icons/tick.png',
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width*.7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "Accpect Terms & Conditions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black54),
                                  ),
                                  Text(
                                    "By selecting this button you will accept our terms and conditions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: AppColors.textColorGreen),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if(controller.term.value ==  false){
                              Get.showSnackbar(Ui.errorSnackBar(
                                  message:"Please agree on terms and condition", title: 'Error'.tr));
                            }else {
                              Get.toNamed(Routes.CREATEJAYGAFORM);
                            }

                            //controller.visible.value++;
                            // controller.loginController();
                          },
                          child: Center(
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              height: 50,
                              width:
                              MediaQuery.of(context).size.width*.5,
                              decoration: BoxDecoration(
                                  color: AppColors.textColorGreen,
                                  borderRadius:
                                  BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: AppColors.backgroundColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),


                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
              : AllAlemnitiesView();
        }),
      ),
    );
  }
}
