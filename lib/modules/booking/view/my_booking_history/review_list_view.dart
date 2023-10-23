import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/booking/view/avaiblity_check.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ReviewListView extends GetView<BookingController> {
  const ReviewListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments[0];
    var data = controller.listingData.value[index];


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
        child: Obx(
                () {

            return   WillPopScope(
              onWillPop: (){
                Get.toNamed(Routes.MAKEBOOKINGDETAILS, arguments: [index] );
                return Future.value(false);
              },
              child: Container(
                  color: AppColors.appBackGroundBrn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.25,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                              color: AppColors.containerColor, width: 2),
                          color: AppColors.containerColor,
                        ),
                        // color: AppColors.backgroundColor,
                        child: CachedNetworkImage(
                          imageUrl: "https://new.jayga.xyz/uploads/listings/${data.images.first.listingFilename}",
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                          placeholder: (context, url) =>
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image(
                              image: AssetImage(
                                'assets/images/demo_room1.png',
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image(
                              image: AssetImage(
                                  'images/img.png'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),

                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Center(
                                child: Text(
                                  "See All Reviews",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                              ),

                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black54),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                      height: 15,
                                      width: 2,
                                      color: Colors.black54
                                  ),
                                  SizedBox(width: 10,),
                                  InkWell(
                                    onTap: (){

                                    },
                                    child: Text(
                                      "${controller.getReview.value.length} reviews",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                          color: AppColors.textColorGreen),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: 140,
                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("Cleanness", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                        ),
                                        Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: Duration(seconds: 2),
                                              height: 20,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  color: AppColors.textColorGreen,
                                                  borderRadius: BorderRadius.circular(50)),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(width: 5,),
                                            Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("Communication", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                        ),
                                        Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: Duration(seconds: 2),
                                              height: 20,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  color: AppColors.textColorGreen,
                                                  borderRadius: BorderRadius.circular(50)),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(width: 5,),
                                            Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("Check-in", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                        ),
                                        Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: Duration(seconds: 2),
                                              height: 20,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  color: AppColors.textColorGreen,
                                                  borderRadius: BorderRadius.circular(50)),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(width: 5,),
                                            Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("Accuracy", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                        ),
                                        Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: Duration(seconds: 2),
                                              height: 20,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  color: AppColors.textColorGreen,
                                                  borderRadius: BorderRadius.circular(50)),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(width: 5,),
                                            Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("Location", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                        ),
                                        Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: Duration(seconds: 2),
                                              height: 20,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  color: AppColors.textColorGreen,
                                                  borderRadius: BorderRadius.circular(50)),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(width: 5,),
                                            Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("Value", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                        ),
                                        Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: Duration(seconds: 2),
                                              height: 20,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  color: AppColors.textColorGreen,
                                                  borderRadius: BorderRadius.circular(50)),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(width: 5,),
                                            Text("5.0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),

                              Divider(thickness: 2,),
                              Container(
                                  height: MediaQuery.of(context).size.height *.8,
                                  child: ListView.builder(
                                      itemCount: controller.getReview.value.length,
                                      itemBuilder: (BuildContext c, i){
                                        var data = controller.getReview[i];
                                        return  ListTile(
                                          title: Row(
                                            children: [
                                              Text(
                                                data.listerName,
                                                style: TextStyle(fontSize: 22),
                                              ),
                                              SizedBox(width: 10,),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 15,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 15,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 15,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 15,

                                                color: Colors.orange,
                                              ),
                                            ],
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "April 2023",
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black54),
                                              ),
                                              Text(
                                                data.description,
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          leading: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/kaif.png"))),
                                            // color: AppColors.backgroundColor,
                                          ),
                                        );
                                      }
                                  )
                              ),

                              Divider(thickness: 1,),







                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
            );
            }
        ),
      ),
    );
  }
}
