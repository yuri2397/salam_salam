import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => Center(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset("assets/images/login-2.jpg",
                        width: 300, height: 300),
                  ),
                  const SizedBox(height: 20),
                  Text("Entrer votre numéro\nde téléphone",
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Get.theme.primaryColor)),
                  const SizedBox(height: 5),
                  Text("Un code de vérification vous sera envoyé.",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 50),
                  Form(
                      key: controller.formKey,
                      child: TextFormField(
                        onChanged: (value) =>
                            controller.phoneNumber.value = value,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Veuillez entrer votre numéro de téléphone";
                          } else if (value.length < 9) {
                            return "Veuillez entrer un numéro de téléphone valide";
                          }
                          return null;
                        },
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            prefix: Text("+221 ",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Get.theme.focusColor)),
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Get.theme.focusColor),
                            label: Text('Numéro de téléphone',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/icons/senegal.png",
                                  width: 10, height: 10),
                            )),
                      )),
                  const SizedBox(height: 40),
                  Center(
                      child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: controller.loading.value
                                  ? null
                                  : () {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        controller.login();
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Get.theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: controller.loading.value
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text("Continuer",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white))))),
                ]),
          ))),
        ));
  }
}
