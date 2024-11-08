import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static const Color primaryColor= Color.fromRGBO(255, 184, 0, 1);
  static const Color yellowColor= Color.fromRGBO(254, 242, 80, 1);
  static const Color greyColor= Color.fromRGBO(153, 153, 153, 1);
  static const Color lightGreyColor= Color.fromRGBO(0, 0, 0, 0.05);
  static const Color containerGreyColor= Color.fromRGBO(243, 241, 254, 1);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  /// border Colors
  static const Color greyBorder= Color.fromRGBO(197, 197, 197, 1);
  static const Color lightGreyBorder= Color.fromRGBO(210, 210, 210, 1);

  ///Gradient Colors
  static const Color startGradient = Color.fromRGBO(255, 184, 0, 1);
  static const Color endGradient = Color.fromRGBO(255, 153, 0, 1);
  static const Color redColor= Color.fromRGBO(255, 39, 78, 1);
  static const Color reddColor= Color.fromRGBO(222, 0, 40, 1);
  static const Color greenColor= Color.fromRGBO(0, 170, 27, 1);
  static const Color lightGreenColor= Color.fromRGBO(0, 217, 35, 1);
  static const Color lightBlueColor= Color.fromRGBO(84, 169, 255, 1);
  static const Color blueColor= Color.fromRGBO(3, 108, 215, 1);
  static const Color lightPurpelColor= Color.fromRGBO(160, 85, 255, 1);
  static const Color purpelColor= Color.fromRGBO(102, 0, 229, 1);



  ///Shadow Color
  static const Color shadowColor= Color.fromRGBO(112, 112, 112, 0.18);
  ///Shadow
  static const shadow= BoxShadow(
      color: shadowColor,
      spreadRadius: 0,
      blurRadius: 12,
      offset: Offset(0, 4),
  );

  ///Gradients
  static const primaryGradient = LinearGradient(
    colors: [AppColor.startGradient, AppColor.endGradient],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const blackGradient = LinearGradient(
    colors: [AppColor.blackColor, AppColor.blackColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const redGradient = LinearGradient(
    colors: [AppColor.redColor, AppColor.reddColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const greenGradient = LinearGradient(
    colors: [AppColor.lightGreenColor, AppColor.greenColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const blueGradient = LinearGradient(
    colors: [AppColor.lightBlueColor, AppColor.blueColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const purpelGradient = LinearGradient(
    colors: [AppColor.lightPurpelColor, AppColor.purpelColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}



Size get mQ => MediaQuery.of(Get.context!).size;



//color ful print statement
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}
void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}
