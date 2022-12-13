import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:salam_salam/components/pages/auth/verification_code.controller.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeController>(() => VerificationCodeController());
  }
}
