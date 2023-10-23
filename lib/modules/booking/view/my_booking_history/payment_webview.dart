import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';









class PaymentWeb extends StatefulWidget {
  String? url;
  String? appBar;
  PaymentWeb({this.url, required this.appBar});
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
                  if (url.toString().contains("success")) {

                    Get.find<BookingController>().makeBookingController(context, lister_id: "74", listing_id: "36");
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