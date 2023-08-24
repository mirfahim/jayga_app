import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jayga/models/auth/login_model.dart';







class AuthService extends GetxService {
  final currentUser = LoginModel().obs;
  late GetStorage _box;
  final used = false.obs;
  final deviceToken = ''.obs;

  final language_key = 'en_US'.obs;

  AuthService() {
    _box = GetStorage();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    _box = GetStorage();
    //getLanguage();
    //  getDeviceToken();

    // getUsed();
    getCurrentUser();
    super.onInit();
  }

  setFirstUseOrNot() async {
    _box.write('used', true);
    getUsed();
  }

  getUsed() {
    if (_box.hasData('used')) {
      used.value = _box.read('used');
    }
  }

  setUser(LoginModel user) async {
    _box.write('currentUser', user.toJson());
    getCurrentUser();
  }

  getCurrentUser() {
    if (_box.hasData('currentUser')) {
      currentUser.value = LoginModel.fromJson(_box.read('currentUser'));
      print("${_box.read('currentUser')}");
    }
    print('customer data: ${currentUser.value.user!.userPhoneNum}');
  }

  Future removeCurrentUser() async {
    currentUser.value = LoginModel();
    await _box.remove('currentUser');
  }

  bool get isAuth => currentUser.value.user!.accToken! == null ? false : true;

  String get apiToken => currentUser.value.user!.accToken!;

  getLanguage() async {
    language_key.value = GetStorage().read<String>('language') ?? 'en_US';
  }

// Future<void> getDeviceToken() async {
//   deviceToken.value = await FirebaseMessaging.instance.getToken() ?? '';
//
//   print('AuthService.getDeviceToken:${deviceToken.value}');
// }
}
