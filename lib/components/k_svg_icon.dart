
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget showSvgIconWidget({required String iconPath, bool replacement = false,
  Widget? page, Function()? onTap,Color? color,double? width,double? height}) {
  return GestureDetector(
      onTap: () {
        if(onTap != null){
          onTap();
        }
        if (page != null){
          if(replacement){
            Get.offAll(() => page);
          }else{
            Get.to(() => page);
          }
        }
      },
      child: SvgPicture.asset(
        iconPath,
        color: color,
        width: width,
        height: height,
      ));
}