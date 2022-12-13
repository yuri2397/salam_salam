import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salam_salam/core/services/auth.service.dart';
import 'package:salam_salam/core/services/users.service.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final userService = Get.find<UserService>();
      Get.log("User service initialized ${userService.user.value}");
      if (mounted) {
        if (userService.isAuthed()) {
          Get.offNamed('/home');
        } else if (userService.user.value.firstTime) {
          Get.offNamed('/intro-view');
        } else {
          Get.offNamed('/login');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 0, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text('Salam Salam',
                style: GoogleFonts.poppins(fontSize: 30, color: Colors.white)),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
