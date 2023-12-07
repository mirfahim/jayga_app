import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:intl/intl.dart';
import '../../../../routes/app_pages.dart';

class MyBookingListHISTORY extends GetView<BookingController> {
  const MyBookingListHISTORY({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Container(
            height: MediaQuery.of(context).size.height *.72,
            child: ListView.builder(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: controller.historyList.length,
              itemBuilder: (BuildContext context, index) {
                var data = controller.historyList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.BOOKINGDETAILSHISTORY, arguments: [index]);
                    },
                    child: Column(

                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height*.25,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.transparent, width: 2),
                              color: AppColors.appBackGroundBrn,
                            ),
                            child: CarouselSlider(
                              options: CarouselOptions(height: 400.0),
                              items: controller.historyListModel.value.bookings![index].listings!.images.map((i) {

                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent
                                      ),
                                      child:   CachedNetworkImage(
                                        //imageUrl: "http://new.jayga.xyz/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                        imageUrl: "https://new.jayga.io/uploads/listings/${i.listingFilename}",
                                        imageBuilder: (context, imageProvider) =>
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.circular(20),
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
                                              'assets/images/jayga_logo.png',
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                        const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Image(
                                            image: AssetImage(
                                              'assets/images/jayga_logo.png',),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            )

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.listings!.listingTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                                  Row(

                                    children: [
                                      Icon(Icons.star,color: Colors.orange,),
                                      Text("5.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange)),
                                    ],
                                  ),

                                ],
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    children: [
                                  TextSpan(
                                    text: "Checkin ",
                                    style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54),
                                  ),
                                  TextSpan(
                                    text: " ${DateFormat.yMd().format(DateTime.parse(data.dateEnter!))}",
                                    style:
                                    Theme.of(context).textTheme.subtitle1,
                                  ),
                                      TextSpan(
                                        text: " Checkout ",
                                        style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54),
                                      ),
                                      TextSpan(
                                        text: " ${DateFormat.yMd()
                                            .format(DateTime.parse(data.dateExit!))}",
                                        style:
                                        Theme.of(context).textTheme.subtitle1,
                                      ),
                                ]),
                              )



                            ],
                          ),
                        ),




                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );


  }
}
