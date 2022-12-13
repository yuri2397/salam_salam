import 'package:get/get.dart';
import 'package:salam_salam/components/pages/auth/auth_bindings.dart';
import 'package:salam_salam/components/pages/auth/login.page.dart';
import 'package:salam_salam/components/pages/auth/verification_code.page.dart';
import 'package:salam_salam/components/pages/auth/verification_code_bindings.dart';
import 'package:salam_salam/components/pages/configuration.page.dart';
import 'package:salam_salam/components/pages/home.page.dart';
import 'package:salam_salam/components/pages/intro_view.dart';
import 'package:salam_salam/components/pages/splash_screen.page.dart';

class RoutePath {
  static const String home = "/home";
  static const String login = "/login";
  static const String configuration = "/configuration";
  static const String splashScreen = "/";
  static const String verificationCode = "/verification-code";
  static const String introView = "/intro-view";
}

class RouteMaps {
  static final List<GetPage> pages = [
    GetPage(
        name: RoutePath.home,
        page: () => const HomePage(title: 'Salam, Salam')),
    GetPage(
        name: RoutePath.login,
        page: () => LoginPage(),
        binding: AuthBindings()),
    GetPage(
        name: RoutePath.configuration, page: () => const ConfigurationPage()),
    GetPage(name: RoutePath.splashScreen, page: () => const SplashScreenPage()),
    GetPage(
        name: RoutePath.verificationCode,
        page: () => VerificationCodePage(),
        binding: VerificationCodeBinding()),
    GetPage(name: RoutePath.introView, page: () => IntroView()),
  ];
}
