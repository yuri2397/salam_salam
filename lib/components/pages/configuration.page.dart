import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salam_salam/core/services/auth.service.dart';

import '../../core/utils/colors.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  // create controller for text field
  final TextEditingController _controller = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // create scoffold with single child scroll view
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          // center title
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Information du profil",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(primaryColor)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Veuillez indiquer votre nom et éventuellement ajouter une photo de profil",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/login-1.jpg"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          focusColor: Color(primaryColor),
                          focusedBorder: const UnderlineInputBorder(),
                          hintText: 'Taper votre nom ici'),
                      cursorColor: Colors.black,
                      autocorrect: false,
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                      onTap: () {
                        log("Open icons");
                      },
                      child: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Color(0XFF6C4AB6),
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(primaryColor))),
                  onPressed: () async {
                    log(_controller.text);
                    var uuid = await _authService.isLoggedIn();
                    log("$uuid");
                  },
                  child: Text("SUIVANT", style: GoogleFonts.poppins()))
            ],
          ),
        ));
  }
}
