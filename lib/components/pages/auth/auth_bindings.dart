import 'package:get/get.dart';
import 'package:salam_salam/components/pages/auth/login.controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
