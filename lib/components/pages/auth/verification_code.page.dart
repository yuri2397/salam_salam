import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salam_salam/components/pages/auth/verification_code.controller.dart';
import 'package:salam_salam/core/services/auth.service.dart';

// ignore: must_be_immutable
class VerificationCodePage extends GetView<VerificationCodeController> {
  static String? token = Get.parameters['verificationId'];

  VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/otp.png", height: 150),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Vérification OTP",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Entrer le code reçu sur le numéro +221 ${controller.user.value.phoneNumber}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                buildPinPut(),
                const SizedBox(
                  height: 20,
                ),
                // create riche text
                RichText(
                    text: TextSpan(
                        text: "Vous n'avez pas reçu de code? ",
                        style: GoogleFonts.poppins(color: Colors.black),
                        children: const [TextSpan(text: 'clique ici')])),

                const SizedBox(
                  height: 20,
                ),
                //loading
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPinPut() {
    return Pinput(
      length: 6,
      defaultPinTheme: PinTheme(
        width: 50,
        height: 50,
        textStyle:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onCompleted: (pin) async {
        log(pin);
        Get.log("token is $token");
        var e = await controller.verifyCode(pin, token!);
        if (e.user != null) {
          Get.log("user is not null");
        }
      },
    );
  }
}
