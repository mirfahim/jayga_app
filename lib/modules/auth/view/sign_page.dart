import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';

import 'package:jayga/utils/AppColors/app_colors.dart';




class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(
              () {
            return Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  // color: AppColors.backgroundColor,
                  child: Image.asset(
                    'assets/images/jayga_logo.png',
                    height: 40,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          maxLines: 1,
                          controller: controller.JobData.value,
                          decoration: new InputDecoration(
                            labelText: 'Email',
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
                        TextFormField(
                          maxLines: 1,
                          controller: controller.passController.value,
                          decoration: new InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Password is Required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //controller.visible.value++;
                   // controller.loginController();
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: controller.visible.value == 1 ? 50 : 60,
                    width: controller.visible.value == 1 ? 50 : 140,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                        BorderRadius.circular(controller.visible.value == 1 ? 60 : 10)),
                    alignment: Alignment.center,
                    child: controller.visible.value == 1
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text("Forgot Password?"),
                Spacer(),
                Container(
                    height: 30,
                    width: Get.width,
                    color: AppColors.primaryColor,
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Do not have an account?", style: TextStyle(color: Colors.white),),
                            Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 15),),
                          ],
                        )))

              ],
            );
          }
      ),
    );
  }
}

