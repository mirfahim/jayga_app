import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

import '../../../routes/app_pages.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: Obx(() {
        return Column(
          children: [
            SizedBox(
              height: 20,
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
            Text(
              "Login/Register",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Continue with Mobile/Email",
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textColorGreen,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      maxLines: 1,
                      controller: controller.JobData.value,
                      decoration: new InputDecoration(
                        labelText: 'Phone Number/Email',
                        suffixIcon: Icon(
                          Icons.email_outlined,
                        ),
                        border: OutlineInputBorder(
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
                    SizedBox(height: 20),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.BASE);
                //controller.visible.value++;
                // controller.loginController();
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: controller.visible.value == 1 ? 50 : 60,
                width: controller.visible.value == 1
                    ? MediaQuery.of(context).size.width * .5
                    : MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    color: AppColors.textColorGreen,
                    borderRadius: BorderRadius.circular(
                        controller.visible.value == 1 ? 60 : 40)),
                alignment: Alignment.center,
                child: controller.visible.value == 1
                    ? Center(child: CircularProgressIndicator())
                    : Text(
                        "Continue",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 12,
                        ),
                      ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.OTPPAGE);
                //controller.visible.value++;
                // controller.loginController();
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: controller.visible.value == 1 ? 50 : 60,
                width: controller.visible.value == 1
                    ? MediaQuery.of(context).size.width * .5
                    : MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        controller.visible.value == 1 ? 10 : 10)),
                alignment: Alignment.center,
                child: controller.visible.value == 1
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/gmail.png',
                          ),
                          Text(
                            "Sign In With Gmail",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.OTPPAGE);
                //controller.visible.value++;
                // controller.loginController();
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: controller.visible.value == 1 ? 50 : 60,
                width: controller.visible.value == 1
                    ? MediaQuery.of(context).size.width * .5
                    : MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        controller.visible.value == 1 ? 10 : 10)),
                alignment: Alignment.center,
                child: controller.visible.value == 1
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/gmail.png',
                          ),
                          Text(
                            "Sign In With Facebook",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
