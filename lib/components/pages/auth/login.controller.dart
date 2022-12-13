import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salam_salam/core/services/auth.service.dart';
import 'package:salam_salam/core/services/users.service.dart';
import 'package:salam_salam/core/utils/routes.dart';
import 'package:salam_salam/core/utils/ui.dart';

class LoginController extends GetxController {
  final phoneNumber = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _user = Get.find<UserService>().user;
  final _authService = Get.find<AuthService>();
  final _storage = GetStorage('_storage');
  final loading = false.obs;

  Future<dynamic> login() async {
    formKey.currentState!.save();

    try {
      // unfocus keyboard
      FocusScope.of(Get.context!).unfocus();
      if (formKey.currentState!.validate()) {
        loading.value = true;
        await _authService.registerWithPhoneNumber("+221${phoneNumber.value}",
            ((phoneAuthCredential) {
          Get.find<UserService>().updateUser(
              phoneNumber: phoneNumber.value,
              smsCode: phoneAuthCredential.smsCode,
              authed: true,
              firstTime: true);

          Ui.successSnackBar(
              title: 'Message envoyé avec succès',
              message: "Code de vérification envoyé à ${phoneNumber.value}");
        }), (String verificationId, int? resendToken) async {
          Ui.successSnackBar(
              title: "Code de vérification",
              message: "Un code de vérification a été envoyé");

          Get.offAllNamed(RoutePath.verificationCode, arguments: {
            "verificationId": verificationId,
            "phoneNumber": phoneNumber.value,
            "resendToken": resendToken
          }, parameters: {
            "phoneNumber": phoneNumber.value,
            "resendToken": resendToken.toString(),
            "verificationId": verificationId
          });
        });
      }
    } catch (e) {
      Get.log("$e");
    } finally {
      loading.value = false;
    }
  }
}
