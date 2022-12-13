import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:salam_salam/core/utils/routes.dart';

class IntroView extends StatefulWidget {
  IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  var pages = <PageViewModel>[
    PageViewModel(
      title: "Title of orange text and bold page",
      body:
          "This is a description on a page with an orange title and bold, big body.",
      image: Center(
        child: Image.asset("assets/images/splash_screens/1.jpg"),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(color: Get.theme.primaryColor, fontSize: 13),
        bodyTextStyle:
            const TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    ),
    PageViewModel(
      title: "Title of orange text and bold page",
      body:
          "This is a description on a page with an orange title and bold, big body.",
      image: Center(
        child: Image.asset("assets/images/splash_screens/2.jpg"),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(color: Get.theme.primaryColor, fontSize: 13),
        bodyTextStyle:
            const TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IntroductionScreen(
          pages: pages,
          showNextButton: false,
          done: Text("Commencer !",
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.w600)),
          onDone: () {
            // On button pressed
            Get.offAllNamed(RoutePath.login);
          },
        ),
      ),
    );
  }
}
