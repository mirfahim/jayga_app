import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/services/auth_services.dart';
import 'package:jayga/routes/app_pages.dart';
import 'package:jayga/services/auth_services.dart';
initAllServices() async {
  Get.log('starting all services ...');

  await GetStorage.init();
  // await Get.putAsync<SettingsService>(() async => SettingsService());
  await Get.putAsync<AuthService>(() async => AuthService());
  Get.log('All services started...');
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAllServices();
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Jayga",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      )
  );
}


