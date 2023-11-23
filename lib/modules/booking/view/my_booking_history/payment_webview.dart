import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';









class PaymentWeb extends StatefulWidget {
  String? url;
  String? appBar;
  String? bookingID;
  String? listerID;
  String? amount;
  String? listingID;
  PaymentWeb({this.url, required this.appBar, this.listingID, this.listerID, this.amount, this.bookingID});
  @override
  _dashboardWebViewClassState createState() => _dashboardWebViewClassState();
}

class _dashboardWebViewClassState extends State<PaymentWeb> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;


  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  double _progress = 0;
  late InAppWebViewController  inAppWebViewController;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        var isLastPage = await inAppWebViewController.canGoBack();
        if(isLastPage){
          Get.offAllNamed(Routes.BASE);
          return false;
        } else {
          Get.offAllNamed(Routes.BASE);
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.textColorGreen,
            title: Text(widget.appBar!),
            centerTitle: true,
            leading: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
          ),

          body: Stack(
            children: [
              InAppWebView(
                initialOptions :InAppWebViewGroupOptions(

                    crossPlatform: InAppWebViewOptions(

                      transparentBackground: true,
                    )
                ),
                //
                initialUrlRequest: URLRequest(
                    url: Uri.parse(widget.url!)
                ),
                onLoadStart: (InAppWebViewController controller, url) {
                  print("i am here 11");
                  print("onLoadStart++++++++++++++++++++++++++ " +
                      url.toString());
                  if (url.toString().contains("success.html")) {

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              insetPadding: EdgeInsets.all(0),
                              elevation: 20,
                              backgroundColor: Colors.white,
                              content: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                    width: MediaQuery.of(context).size.width * .7,
                                    height: MediaQuery.of(context).size.width * .4,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Your transaction has been successful!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        Text("Your booking has been placed",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 18)),
                                        Text(
                                            "You can view your bookings in the ‘My Bookings’ tab in the menu section.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18)),
                                      ],
                                    )),
                              ));
                        });

                    BookingController().paymentStatus(listingId: widget.listingID , listerID: widget.listerID, bookingId: widget.bookingID, pay: widget.amount);


                    // Redirect to a different URL


                  }
                },
                onWebViewCreated: (InAppWebViewController controller){
                  print("working on ongoing project now");

                  inAppWebViewController = controller;
                  print("my url is ${inAppWebViewController.getUrl()}");

                },
                onProgressChanged: (InAppWebViewController controller , int progress){
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1 ? Container(
                child: LinearProgressIndicator(
                  value: _progress,
                ),
              ):SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}