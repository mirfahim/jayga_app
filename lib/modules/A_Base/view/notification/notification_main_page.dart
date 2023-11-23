import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class NotificationListView extends GetView<HomeController> {
  const NotificationListView({Key? key}) : super(key: key);

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
        child:  Container(
            color: AppColors.appBackGroundBrn,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Notifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height *.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemCount: 8,
                          itemBuilder: (BuildContext context, index){
                          return Card(
                            child: ListTile(
                              title: Text("Hosting insights and rewards",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              subtitle: Text("Learn about best hosting practices and getaccess to exclusive hosting perks "),
                            ),
                          );
                          })
                    ),
                  ),
                ],
              ),
            ),
          ),

      ),
    );
  }
}
