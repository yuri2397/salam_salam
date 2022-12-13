import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salam_salam/core/services/auth.service.dart';
import 'package:salam_salam/core/services/users.service.dart';
import 'package:salam_salam/core/utils/app_theme.dart';

import 'core/utils/routes.dart';

Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  await Get.putAsync(() => UserService().init());
  await Get.putAsync<AuthService>(() => AuthService().init());
}

Future<void> main() async {
  await initServices();
  runApp(GetMaterialApp(
    title: "Salam, Salam",
    initialRoute: RoutePath.splashScreen,
    getPages: RouteMaps.pages,
    debugShowCheckedModeBanner: false,
    theme: AppTheme1.theme,
  ));
}
