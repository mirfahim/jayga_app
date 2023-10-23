import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/modules/host_setup/controller/host_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class DoYouHaveAnyRestriction extends GetView<HostController> {
  const DoYouHaveAnyRestriction({Key? key}) : super(key: key);

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
                            "Do you have any restrictions?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          Text(
                            "What are not allowed?",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: Colors.black54),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: (){
                                  if(controller.rIndoorSmoking.value == 0){
                                    controller.rIndoorSmoking.value = 1;
                                  }else {
                                    controller.rIndoorSmoking.value = 0;
                                  }
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.height *.1,
                                    width: MediaQuery.of(context).size.width *.3,
                                    decoration: BoxDecoration(
                                        color: controller.rIndoorSmoking.value == 0 ? Colors.white : Colors.green,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Card(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: DecorationImage(

                                                  fit: BoxFit.fill,
                                                  image: AssetImage(

                                                    'assets/icons/cabin.png',
                                                  ),
                                                )),
                                          ),
                                          Text("Indoor smoking")
                                        ],
                                      ),
                                    )
                                ),),
                              InkWell(
                                onTap: (){
                                  if(controller.rParty.value == 0){
                                    controller.rParty.value = 1;
                                  }else {
                                    controller.rParty.value = 0;
                                  }
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.height *.1,
                                    width: MediaQuery.of(context).size.width *.3,
                                    decoration: BoxDecoration(
                                        color: controller.rParty.value == 0 ? Colors.white : Colors.green,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Card(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                    'assets/icons/cabin.png',
                                                  ),
                                                )),
                                          ),
                                          Text("Party")
                                        ],
                                      ),
                                    )
                                ),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: (){
                                  if(controller.rPets.value == 0){
                                    controller.rPets.value = 1;
                                  }else {
                                    controller.rPets.value = 0;
                                  }
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.height *.1,
                                    width: MediaQuery.of(context).size.width *.3,
                                    decoration: BoxDecoration(
                                        color: controller.rPets.value == 0 ? Colors.white : Colors.green,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Card(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: DecorationImage(

                                                  fit: BoxFit.fill,
                                                  image: AssetImage(

                                                    'assets/icons/cabin.png',
                                                  ),
                                                )),
                                          ),
                                          Text("Pets")
                                        ],
                                      ),
                                    )
                                ),),
                              InkWell(
                                onTap: (){
                                  if(controller.rUnvaccinnated.value == 0){
                                    controller.rUnvaccinnated.value = 1;
                                  }else {
                                    controller.rUnvaccinnated.value = 0;
                                  }
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.height *.1,
                                    width: MediaQuery.of(context).size.width *.3,
                                    decoration: BoxDecoration(
                                        color: controller.rUnvaccinnated.value == 0 ? Colors.white : Colors.green,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Card(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                    'assets/icons/cabin.png',
                                                  ),
                                                )),
                                          ),
                                          Text("Unvaccinated")
                                        ],
                                      ),
                                    )
                                ),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: (){
                                  if(controller.rLateNigth.value == 0){
                                    controller.rLateNigth.value = 1;
                                  }else {
                                    controller.rLateNigth.value = 0;
                                  }
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.height *.1,
                                    width: MediaQuery.of(context).size.width *.3,
                                    decoration: BoxDecoration(
                                        color: controller.rLateNigth.value == 0 ? Colors.white : Colors.green,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Card(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: DecorationImage(

                                                  fit: BoxFit.fill,
                                                  image: AssetImage(

                                                    'assets/icons/cabin.png',
                                                  ),
                                                )),
                                          ),
                                          Text("Late night entry")
                                        ],
                                      ),
                                    )),
                              ),
                              InkWell(
                                onTap: (){
                                  if(controller.rUnknwnGst.value == 0){
                                    controller.rUnknwnGst.value = 1;
                                  }else {
                                    controller.rUnknwnGst.value = 0;
                                  }
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.height *.1,
                                    width: MediaQuery.of(context).size.width *.3,
                                    decoration: BoxDecoration(
                                        color: controller.rUnknwnGst.value == 0 ? Colors.white : Colors.green,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Card(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                    'assets/icons/cabin.png',
                                                  ),
                                                )),
                                          ),
                                          Text("Unknown Guest")
                                        ],
                                      ),
                                    )
                                ),)
                            ],
                          ),
                          Text(
                            "Anything specific requirements for the guest?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(16.0),

                            child: TextFormField(

                              maxLines: 3,
                              controller: controller.rAnythingSpecificMessage.value,
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: AppColors.jaygaWhite,
                                focusColor: Colors.white,
                                labelText: 'The gate will be off within 12AM, No entry after 12AM',
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
        );
           }
         )


    );

  }
}
