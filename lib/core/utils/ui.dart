import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salam_salam/core/utils/colors.dart';

class Ui {
  static SnackbarController successSnackBar(
      {String title = 'Success',
      required String message,
      SnackPosition snackPosition = SnackPosition.BOTTOM,
      IconData? icon}) {
    Get.log("[$title] $message");
    return Get.snackbar(
      title,
      message,
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              ?.merge(TextStyle(color: Get.textTheme.caption!.color))),
      messageText: Text(message,
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.textTheme.caption!.color))),
      snackPosition: snackPosition,
      margin: const EdgeInsets.all(20),
      backgroundColor: Color(successColor),
      icon: icon != null
          ? Icon(icon, size: 32, color: Get.textTheme.caption!.color)
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 5),
    );
  }

  static SnackbarController errorSnackBar(
      {String title = 'Error',
      required String message,
      SnackPosition snackPosition = SnackPosition.BOTTOM,
      IconData? icon}) {
    Get.log("[$title] $message");
    return Get.snackbar(
      title,
      message,
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              ?.merge(TextStyle(color: Get.textTheme.caption!.color))),
      messageText: Text(message,
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.textTheme.caption!.color))),
      snackPosition: snackPosition,
      margin: const EdgeInsets.all(20),
      backgroundColor: Color(errorColor),
      icon: icon != null
          ? Icon(icon, size: 32, color: Get.textTheme.caption!.color)
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 5),
    );
  }

  static SnackbarController defaultSnackBar(
      {String title = 'Alert',
      required String message,
      SnackPosition snackPosition = SnackPosition.BOTTOM,
      IconData? icon}) {
    Get.log("[$title] $message", isError: false);
    return Get.snackbar(
      title,
      message,
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              ?.merge(TextStyle(color: Get.textTheme.caption!.color))),
      messageText: Text(message,
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.textTheme.caption!.color))),
      snackPosition: snackPosition,
      margin: const EdgeInsets.all(20),
      backgroundColor: Color(primaryColor),
      icon: icon != null
          ? Icon(icon, size: 32, color: Get.textTheme.caption!.color)
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 5),
    );
  }

  static GetSnackBar notificationSnackBar(
      {String title = 'Notification',
      required String message,
      OnTap? onTap,
      Widget? mainButton}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      onTap: onTap,
      mainButton: mainButton,
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              ?.merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message,
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon:
          Icon(Icons.notifications_none, size: 32, color: Get.theme.hintColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static Color parseColor(String hexCode, {double opacity = 1}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  static List<Icon> getStarsList(double rate, {double size = 18}) {
    var list = <Icon>[];
    list = List.generate(rate.floor(), (index) {
      return Icon(Icons.star, size: size, color: Color(warningColor));
    });
    if (rate - rate.floor() > 0) {
      list.add(Icon(Icons.star_half, size: size, color: Color(warningColor)));
    }
    list.addAll(
        List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
      return Icon(Icons.star_border, size: size, color: Color(warningColor));
    }));
    return list;
  }

  static BoxDecoration getBoxDecoration(
      {Color? color, double? radius, Border? border, Gradient? gradient}) {
    return BoxDecoration(
      color: color ?? Get.theme.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      boxShadow: [
        BoxShadow(
            color: Get.theme.focusColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5)),
      ],
      border:
          border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
      gradient: gradient,
    );
  }
}
