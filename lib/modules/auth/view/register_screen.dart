import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jayga/utils/ui_support.dart';

import '../../../routes/app_pages.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return Scaffold(
          backgroundColor: AppColors.appBackGroundBrn,
          bottomNavigationBar: InkWell(
            onTap: () {
              if(controller.emailController.value.text.isEmpty || controller.fullName.value.text.isEmpty){
                Get.showSnackbar(Ui.errorSnackBar(
                    message: "Please fill all the field", title: 'Error'.tr));
              }else{
                controller.registerController();
              }

              //controller.visible.value++;
              // controller.loginController();
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              height: controller.visibleRegister.value == 1 ? 50 : 100,
              width: controller.visibleRegister.value == 1
                  ? MediaQuery.of(context).size.width * .5
                  : MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                  color: AppColors.textColorGreen,
                  borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(controller.visibleRegister.value == 1 ? 60 : 80),
                    topRight: Radius.circular(controller.visibleRegister.value == 1 ? 60 : 80),

                      )),
              alignment: Alignment.center,
              child: controller.visibleRegister.value == 1
                  ? Center(child: CircularProgressIndicator())
                  : Text(
                "Continue",
                style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          body:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      // color: AppColors.backgroundColor,
                      child: Image.asset(
                        'assets/images/jayga_logo.png',
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Please Provide All",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Center(
                      child: Text(
                        "The Information",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    SizedBox(height: 20,),
                    Text(
                      "Full Name*",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(

                      maxLines: 1,
                      controller: controller.fullName.value,
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: AppColors.jaygaWhite,
                        focusColor: Colors.white,
                        labelText: 'Input Full Name',
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
                    SizedBox(height: 20,),
                    Text(
                      "District*",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: MediaQuery.of(context).size.height * .1,
                      decoration: BoxDecoration(
                          color: AppColors.jaygaShadowBrwn,
                          borderRadius: BorderRadius.circular(20)),
                      child:  ListTile(
                        title: Text("Where to?"),
                        subtitle: Container(
                          height: 45,
                          color: Colors.white,
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            // dropdownSearchDecoration: Ui.getInputDecorationWithIcon(
                            //   hintText: '',
                            //   // iconData:
                            //   //     CupertinoIcons.location_solid,
                            // ),
                            showSelectedItems: true,
                            items: controller.getAllDistrict.isNotEmpty
                                ? controller.getAllDistrict!
                                .map((item) => item.name!)
                                .toList()
                                : [],
                            onChanged: (input) {

                            },
                            selectedItem: "Select District".tr,
                          ),
                        ),

                      ),
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date of Birth**",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,

                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: TextFormField(
                                  controller: controller.dateController.value,
                                  readOnly: true,
                                  onTap: () {
                                    controller
                                        .selectBirthDateController(
                                        context);
                                    // DatePicker.showDateTimePicker(context,
                                    //     showTitleActions: true,
                                    //     onChanged: (date) {
                                    //       print('change $date in time zone ' +
                                    //           date.timeZoneOffset.inHours
                                    //               .toString());
                                    //     }, onConfirm: (date) {
                                    //       String myDate = DateTime(
                                    //           date.year, date.month, date.day)
                                    //           .toString();
                                    //       String myTime = DateTime(
                                    //         date.hour,
                                    //         date.minute,
                                    //       ).toString();
                                    //       print(
                                    //           "my min and sec for due is $myTime");
                                    //
                                    //       textController: controller.dateController.value.text =
                                    //           myDate.substring(0, 10);
                                    //       textController: controller.dateController.value.text =
                                    //           date.toString().substring(11, 16);
                                    //       print('confirm $date');
                                    //     }, currentTime: DateTime.now());
                                  },
                                  onChanged: (value) {
                                    // _productController.searchProduct(value);
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.jaygaWhite,
                                  focusColor: Colors.white,
                                  labelText: 'DD/MM/YY',
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
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Phone no*",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: controller.phoneNumCOntroller.value,

                                maxLines: 1,
                                readOnly:  true,

                                //controller: controller.phoneNumCOntroller.value,

                                decoration: new InputDecoration(


                                  filled: true,
                                  fillColor: AppColors.jaygaWhite,
                                  focusColor: Colors.white,
                                  labelText: controller.box.value.read("phone"),
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

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Email Address*",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(

                      maxLines: 1,
                      controller: controller.emailController.value,
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: AppColors.jaygaWhite,
                        focusColor: Colors.white,
                        labelText: 'Email',
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
                    SizedBox(height: 20,),
                    Text(
                      "Emergency Contact No*",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(

                      maxLines: 1,
                      controller: controller.emgPhn.value,
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: AppColors.jaygaWhite,
                        focusColor: Colors.white,
                        labelText: 'Phone Number/Email',
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
                    SizedBox(height: 20,),


                  ],
                ),
              ),
            ),

        );
      }
    );
  }
}
