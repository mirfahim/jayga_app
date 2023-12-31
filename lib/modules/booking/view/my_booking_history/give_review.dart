import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jayga/utils/ui_support.dart';
import '../../controller/booking_controller.dart';

class GiveReviewScreen extends GetView<BookingController> {
  const GiveReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments[0];
    var data = controller.historyList[index];
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.appBackGroundBrn,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: Get.height*.1,
                      width: Get.width*.2,
                      // color: AppColors.backgroundColor,
                      child: CachedNetworkImage(
                        imageUrl: "https://new.jayga.io/uploads/listings/${data.listings!.images.first.listingFilename}",
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
                      )
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Booking Details:",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black54),
                          ),
                          Text(
                            "${data.listings!.bedNum.toString()} Bed, ${data.listings!.bathroomNum.toString()} Bath",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          Text(
                            data.listings!.listingAddress!,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: AppColors.textColorGreen),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rating",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Center(
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    allowHalfRating: false,
                    direction: Axis.horizontal,

                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      controller.ratingNum.value = rating;
                      print(rating);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Experience",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    maxLines: 10,
                    controller: controller.reviewController.value,
                    decoration: new InputDecoration(
                      // hintText: "Please share your Experience",
                      filled: true,
                      fillColor: AppColors.jaygaWhite,
                      focusColor: Colors.white,
                      labelText: 'Please share your Experience',
                      // suffixIcon: Icon(
                      //   Icons.email_outlined,
                      // ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
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
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if(controller.reviewController.value.text.isEmpty || controller.ratingNum.value == 0){
                      Get.showSnackbar(Ui.errorSnackBar(
                          message: "Please give comment and give stars", title: 'Error'.tr));
                    }else{
                      controller.makeReview(stars: controller.ratingNum.value, listingId: data.listingId);
                    }

                  },
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: controller.visibleReview.value == 1 ? 40 : 60,
                      width: controller.visibleReview.value == 1
                          ? MediaQuery.of(context).size.width * .3
                          : MediaQuery.of(context).size.width * .5,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColorYellow,
                          borderRadius: BorderRadius.circular(
                              controller.visibleReview.value == 1 ? 60 : 10)),
                      alignment: Alignment.center,
                      child: controller.visibleReview.value == 1
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                              "Save Review",
                              style: TextStyle(
                                color: AppColors.backgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                    ),
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
