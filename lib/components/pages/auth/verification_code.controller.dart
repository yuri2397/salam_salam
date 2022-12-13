import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:salam_salam/core/models/user.model.dart' as model;
import 'package:salam_salam/core/services/auth.service.dart';
import 'package:salam_salam/core/services/users.service.dart';
import 'package:salam_salam/core/utils/ui.dart';

class VerificationCodeController extends GetxController {
  final Rx<model.User> user = Get.find<UserService>().user;
  final RxString verificationId = "".obs;
  final RxString smsCode = "".obs;
  final UserService _userService = Get.find<UserService>();
  final AuthService _authService = Get.find<AuthService>();
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    user.value = _userService.user.value;
    Get.log("user value: ${user.value}");
  }

  // send confit otp code
  Future<UserCredential> verifyCode(String code, String token) async {
    // Create a PhoneAuthCredential with the code
    try {
      isLoading.value = true;
      return await _authService.signInWithPhoneNumber(token, code);
    } catch (e) {
      Ui.errorSnackBar(message: "Code de vérification incorrect");
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
