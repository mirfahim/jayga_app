import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundBrn,
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                  ),
                  title: Text("Kaif Shiam"),
                  subtitle: Text("Edit Profile"),
                  trailing: Icon(Icons.navigate_next),

                ),
                Divider(),

                Container(
                  height: 100,

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(20)),
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      title: Text("Setup your own place"),
                      subtitle: Text("It’s simple to get set up and start earning."),
                      trailing: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/images/jayga_logo.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 20,),


                SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                  child: ListView(
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Support",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),

                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Legal",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),

                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Text(
                          "Log out",
                          style: TextStyle(

                              fontSize: 14,
                              color: AppColors.textColorGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),

    );
  }
}
