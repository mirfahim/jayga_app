import 'dart:async';
import 'dart:math';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jayga/models/district_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../models/auth/login_model.dart';
import '../../../repositories/auth/auth_rep.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';
import 'package:intl/intl.dart';


class AuthController extends GetxController {
  //TODO: Implement LoginController
  EmailOTP myauth = EmailOTP();
  var fullName = TextEditingController().obs;
  var emailController = TextEditingController().obs;

  final getAllDistrict = <DistrictModel>[].obs;
  var phoneNumCOntroller = TextEditingController().obs;
  var emgPhn = TextEditingController().obs;
  var email = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var dateController = TextEditingController().obs;
  var pinCodeController = TextEditingController().obs;
  final registerToken = "".obs;
  final formKey = GlobalKey<FormState>();
  final visibleForLogin = 0.obs;
  final visibleForGoogle = 0.obs;
  final visibleForFB = 0.obs;
  final visibleOTP = 0.obs;
  final visibleRegister = 0.obs;
  final  fcmToken = "".obs;
  final box = GetStorage().obs;
  final otpNum = 0.obs;
  // date

  DateTime selectBirthDate = DateTime.now();

  var selectedBirthdate = ''.obs;

  var myFormat = DateFormat('yyyy-MM-dd');
  // end date
  StreamController<ErrorAnimationType>? pinErrorController;
  @override
  void onInit() {
    getFcmToken();
    pinErrorController = StreamController<ErrorAnimationType>();
    getDistrictData();
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  sendOTP(BuildContext context) async {
    print("otp is sending to ${email.value.text.toString()}");
    myauth.setConfig(
        appEmail: "majorrip0@gmail.com",
        appName: "Jayga Ltd",
        userEmail: email.value.text.toString(),
        otpLength: 6,
        otpType: OTPType.digitsOnly);
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("OTP has been sent to ${email.value.text.toString()}"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }
  getFcmToken()async {
    print("fcm token called");
    final _firebaseMessaging = FirebaseMessaging.instance;
    fcmToken.value = (await _firebaseMessaging.getToken())!;
    print("my fcm token is ${fcmToken.value}");
  }
  Future<void> selectBirthDateController(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectBirthDate,
      firstDate:  DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectBirthDate) {
      selectBirthDate = picked;
    }
    selectedBirthdate.value = "${myFormat.format(selectBirthDate)}";
    dateController.value.text = selectedBirthdate.value;
  }
  loginController() async{
    visibleForLogin.value++;
    AuthRepository().userLogin(phoneNumCOntroller.value.text, fcmToken.value).then((e) async{

      print("my login data $e");
      if(e != null){
        var data = LoginModel.fromJson(e);
        await Get.find<AuthService>().setUser(data);
        visibleForLogin.value = 0;
        //print("hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");

        if(data.messege! == "User already exist") {
          Get.offAllNamed(Routes.BASE);
        } else {
        // registerToken.value = e['user']["bearer_token"];
          Get.offAllNamed(Routes.REGISTER);
        }

      } else {
        print("error ++++++++++++++");
        visibleForLogin.value = 0;

      }

    });
  }
  makeRandomOtpNUm(){
    var rng = new Random();
    otpNum.value =  rng.nextInt(900000) + 100000;
    print("my otp code is ${otpNum.value}");
    sendOtpWithMuthoFun() ;
  }
  sendOtpWithMuthoFun() async{
    visibleOTP.value++;
    AuthRepository().sendOtpWithMuthoFun(phoneNumCOntroller.value.text, otpNum.value.toString() ).then((e) async{
      print("hlw muthofun1");
      if(e['message']== "SMS queued successfully!"){
        print("hlw muthofun2");
        visibleOTP.value = 0;
        Get.toNamed(Routes.OTPPAGE);

      }else {
        print("hlw muthofun3");
        visibleOTP.value = 0;
      }

      print("my login data $e");


    });
  }


  registerController() async{
    visibleRegister.value++;
    AuthRepository().registerRep(name:fullName.value.text, email:emailController.value.text, dob: DateTime.now().toString(),phone: box.value.read("phone")).then((e) async{

      print("my registerr data $e");
      if(e != null){

        visibleRegister.value = 0;



          Get.offAllNamed(Routes.BASE);



      } else {
        print("error ++++++++++++++");
        visibleRegister.value = 0;

      }

    });
  }

  getDistrictData() {
    List<Map<String, dynamic>> data = [
      {
        "id": "1",
        "division_id": "3",
        "name": "Dhaka",
        "bn_name": "ঢাকা",
        "lat": "23.7115253",
        "long": "90.4111451"
      },
      {
        "id": "2",
        "division_id": "3",
        "name": "Faridpur",
        "bn_name": "ফরিদপুর",
        "lat": "23.6070822",
        "long": "89.8429406"
      },
      {
        "id": "3",
        "division_id": "3",
        "name": "Gazipur",
        "bn_name": "গাজীপুর",
        "lat": "24.0022858",
        "long": "90.4264283"
      },
      {
        "id": "4",
        "division_id": "3",
        "name": "Gopalganj",
        "bn_name": "গোপালগঞ্জ",
        "lat": "23.0050857",
        "long": "89.8266059"
      },
      {
        "id": "5",
        "division_id": "8",
        "name": "Jamalpur",
        "bn_name": "জামালপুর",
        "lat": "24.937533",
        "long": "89.937775"
      },
      {
        "id": "6",
        "division_id": "3",
        "name": "Kishoreganj",
        "bn_name": "কিশোরগঞ্জ",
        "lat": "24.444937",
        "long": "90.776575"
      },
      {
        "id": "7",
        "division_id": "3",
        "name": "Madaripur",
        "bn_name": "মাদারীপুর",
        "lat": "23.164102",
        "long": "90.1896805"
      },
      {
        "id": "8",
        "division_id": "3",
        "name": "Manikganj",
        "bn_name": "মানিকগঞ্জ",
        "lat": "23.8644",
        "long": "90.0047"
      },
      {
        "id": "9",
        "division_id": "3",
        "name": "Munshiganj",
        "bn_name": "মুন্সিগঞ্জ",
        "lat": "23.5422",
        "long": "90.5305"
      },
      {
        "id": "10",
        "division_id": "8",
        "name": "Mymensingh",
        "bn_name": "ময়মনসিংহ",
        "lat": "24.7471",
        "long": "90.4203"
      },
      {
        "id": "11",
        "division_id": "3",
        "name": "Narayanganj",
        "bn_name": "নারায়াণগঞ্জ",
        "lat": "23.63366",
        "long": "90.496482"
      },
      {
        "id": "12",
        "division_id": "3",
        "name": "Narsingdi",
        "bn_name": "নরসিংদী",
        "lat": "23.932233",
        "long": "90.71541"
      },
      {
        "id": "13",
        "division_id": "8",
        "name": "Netrokona",
        "bn_name": "নেত্রকোণা",
        "lat": "24.870955",
        "long": "90.727887"
      },
      {
        "id": "14",
        "division_id": "3",
        "name": "Rajbari",
        "bn_name": "রাজবাড়ি",
        "lat": "23.7574305",
        "long": "89.6444665"
      },
      {
        "id": "15",
        "division_id": "3",
        "name": "Shariatpur",
        "bn_name": "শরীয়তপুর",
        "lat": "23.2423",
        "long": "90.4348"
      },
      {
        "id": "16",
        "division_id": "8",
        "name": "Sherpur",
        "bn_name": "শেরপুর",
        "lat": "25.0204933",
        "long": "90.0152966"
      },
      {
        "id": "17",
        "division_id": "3",
        "name": "Tangail",
        "bn_name": "টাঙ্গাইল",
        "lat": "24.2513",
        "long": "89.9167"
      },
      {
        "id": "18",
        "division_id": "5",
        "name": "Bogura",
        "bn_name": "বগুড়া",
        "lat": "24.8465228",
        "long": "89.377755"
      },
      {
        "id": "19",
        "division_id": "5",
        "name": "Joypurhat",
        "bn_name": "জয়পুরহাট",
        "lat": "25.0968",
        "long": "89.0227"
      },
      {
        "id": "20",
        "division_id": "5",
        "name": "Naogaon",
        "bn_name": "নওগাঁ",
        "lat": "24.7936",
        "long": "88.9318"
      },
      {
        "id": "21",
        "division_id": "5",
        "name": "Natore",
        "bn_name": "নাটোর",
        "lat": "24.420556",
        "long": "89.000282"
      },
      {
        "id": "22",
        "division_id": "5",
        "name": "Nawabganj",
        "bn_name": "নবাবগঞ্জ",
        "lat": "24.5965034",
        "long": "88.2775122"
      },
      {
        "id": "23",
        "division_id": "5",
        "name": "Pabna",
        "bn_name": "পাবনা",
        "lat": "23.998524",
        "long": "89.233645"
      },
      {
        "id": "24",
        "division_id": "5",
        "name": "Rajshahi",
        "bn_name": "রাজশাহী",
        "lat": "24.3745",
        "long": "88.6042"
      },
      {
        "id": "25",
        "division_id": "5",
        "name": "Sirajgonj",
        "bn_name": "সিরাজগঞ্জ",
        "lat": "24.4533978",
        "long": "89.7006815"
      },
      {
        "id": "26",
        "division_id": "6",
        "name": "Dinajpur",
        "bn_name": "দিনাজপুর",
        "lat": "25.6217061",
        "long": "88.6354504"
      },
      {
        "id": "27",
        "division_id": "6",
        "name": "Gaibandha",
        "bn_name": "গাইবান্ধা",
        "lat": "25.328751",
        "long": "89.528088"
      },
      {
        "id": "28",
        "division_id": "6",
        "name": "Kurigram",
        "bn_name": "কুড়িগ্রাম",
        "lat": "25.805445",
        "long": "89.636174"
      },
      {
        "id": "29",
        "division_id": "6",
        "name": "Lalmonirhat",
        "bn_name": "লালমনিরহাট",
        "lat": "25.9923",
        "long": "89.2847"
      },
      {
        "id": "30",
        "division_id": "6",
        "name": "Nilphamari",
        "bn_name": "নীলফামারী",
        "lat": "25.931794",
        "long": "88.856006"
      },
      {
        "id": "31",
        "division_id": "6",
        "name": "Panchagarh",
        "bn_name": "পঞ্চগড়",
        "lat": "26.3411",
        "long": "88.5541606"
      },
      {
        "id": "32",
        "division_id": "6",
        "name": "Rangpur",
        "bn_name": "রংপুর",
        "lat": "25.7558096",
        "long": "89.244462"
      },
      {
        "id": "33",
        "division_id": "6",
        "name": "Thakurgaon",
        "bn_name": "ঠাকুরগাঁও",
        "lat": "26.0336945",
        "long": "88.4616834"
      },
      {
        "id": "34",
        "division_id": "1",
        "name": "Barguna",
        "bn_name": "বরগুনা",
        "lat": "22.0953",
        "long": "90.1121"
      },
      {
        "id": "35",
        "division_id": "1",
        "name": "Barishal",
        "bn_name": "বরিশাল",
        "lat": "22.7010",
        "long": "90.3535"
      },
      {
        "id": "36",
        "division_id": "1",
        "name": "Bhola",
        "bn_name": "ভোলা",
        "lat": "22.685923",
        "long": "90.648179"
      },
      {
        "id": "37",
        "division_id": "1",
        "name": "Jhalokati",
        "bn_name": "ঝালকাঠি",
        "lat": "22.6406",
        "long": "90.1987"
      },
      {
        "id": "38",
        "division_id": "1",
        "name": "Patuakhali",
        "bn_name": "পটুয়াখালী",
        "lat": "22.3596316",
        "long": "90.3298712"
      },
      {
        "id": "39",
        "division_id": "1",
        "name": "Pirojpur",
        "bn_name": "পিরোজপুর",
        "lat": "22.5841",
        "long": "89.9720"
      },
      {
        "id": "40",
        "division_id": "2",
        "name": "Bandarban",
        "bn_name": "বান্দরবান",
        "lat": "22.1953275",
        "long": "92.2183773"
      },
      {
        "id": "41",
        "division_id": "2",
        "name": "Brahmanbaria",
        "bn_name": "ব্রাহ্মণবাড়িয়া",
        "lat": "23.9570904",
        "long": "91.1119286"
      },
      {
        "id": "42",
        "division_id": "2",
        "name": "Chandpur",
        "bn_name": "চাঁদপুর",
        "lat": "23.2332585",
        "long": "90.6712912"
      },
      {
        "id": "43",
        "division_id": "2",
        "name": "Chattogram",
        "bn_name": "চট্টগ্রাম",
        "lat": "22.335109",
        "long": "91.834073"
      },
      {
        "id": "44",
        "division_id": "2",
        "name": "Cumilla",
        "bn_name": "কুমিল্লা",
        "lat": "23.4682747",
        "long": "91.1788135"
      },
      {
        "id": "45",
        "division_id": "2",
        "name": "Cox's Bazar",
        "bn_name": "কক্স বাজার",
        "lat": "21.4272",
        "long": "92.0058"
      },
      {
        "id": "46",
        "division_id": "2",
        "name": "Feni",
        "bn_name": "ফেনী",
        "lat": "23.0159",
        "long": "91.3976"
      },
      {
        "id": "47",
        "division_id": "2",
        "name": "Khagrachari",
        "bn_name": "খাগড়াছড়ি",
        "lat": "23.119285",
        "long": "91.984663"
      },
      {
        "id": "48",
        "division_id": "2",
        "name": "Lakshmipur",
        "bn_name": "লক্ষ্মীপুর",
        "lat": "22.942477",
        "long": "90.841184"
      },
      {
        "id": "49",
        "division_id": "2",
        "name": "Noakhali",
        "bn_name": "নোয়াখালী",
        "lat": "22.869563",
        "long": "91.099398"
      },
      {
        "id": "50",
        "division_id": "2",
        "name": "Rangamati",
        "bn_name": "রাঙ্গামাটি",
        "lat": "22.7324",
        "long": "92.2985"
      },
      {
        "id": "51",
        "division_id": "7",
        "name": "Habiganj",
        "bn_name": "হবিগঞ্জ",
        "lat": "24.374945",
        "long": "91.41553"
      },
      {
        "id": "52",
        "division_id": "7",
        "name": "Maulvibazar",
        "bn_name": "মৌলভীবাজার",
        "lat": "24.482934",
        "long": "91.777417"
      },
      {
        "id": "53",
        "division_id": "7",
        "name": "Sunamganj",
        "bn_name": "সুনামগঞ্জ",
        "lat": "25.0658042",
        "long": "91.3950115"
      },
      {
        "id": "54",
        "division_id": "7",
        "name": "Sylhet",
        "bn_name": "সিলেট",
        "lat": "24.8897956",
        "long": "91.8697894"
      },
      {
        "id": "55",
        "division_id": "4",
        "name": "Bagerhat",
        "bn_name": "বাগেরহাট",
        "lat": "22.651568",
        "long": "89.785938"
      },
      {
        "id": "56",
        "division_id": "4",
        "name": "Chuadanga",
        "bn_name": "চুয়াডাঙ্গা",
        "lat": "23.6401961",
        "long": "88.841841"
      },
      {
        "id": "57",
        "division_id": "4",
        "name": "Jashore",
        "bn_name": "যশোর",
        "lat": "23.16643",
        "long": "89.2081126"
      },
      {
        "id": "58",
        "division_id": "4",
        "name": "Jhenaidah",
        "bn_name": "ঝিনাইদহ",
        "lat": "23.5448176",
        "long": "89.1539213"
      },
      {
        "id": "59",
        "division_id": "4",
        "name": "Khulna",
        "bn_name": "খুলনা",
        "lat": "22.815774",
        "long": "89.568679"
      },
      {
        "id": "60",
        "division_id": "4",
        "name": "Kushtia",
        "bn_name": "কুষ্টিয়া",
        "lat": "23.901258",
        "long": "89.120482"
      },
      {
        "id": "61",
        "division_id": "4",
        "name": "Magura",
        "bn_name": "মাগুরা",
        "lat": "23.487337",
        "long": "89.419956"
      },
      {
        "id": "62",
        "division_id": "4",
        "name": "Meherpur",
        "bn_name": "মেহেরপুর",
        "lat": "23.762213",
        "long": "88.631821"
      },
      {
        "id": "63",
        "division_id": "4",
        "name": "Narail",
        "bn_name": "নড়াইল",
        "lat": "23.172534",
        "long": "89.512672"
      },
      {
        "id": "64",
        "division_id": "4",
        "name": "Satkhira",
        "bn_name": "সাতক্ষীরা",
        "lat": "22.7185",
        "long": "89.0705"
      }
    ];
    getAllDistrict.value = data.map((d) => DistrictModel.fromJson(d)).toList();
  }
}
