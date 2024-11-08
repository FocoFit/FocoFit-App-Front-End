import 'package:flutter/material.dart';
import 'package:focofit/controller/splash_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(SplashController()),
        builder: (c) {
          return Scaffold(
              backgroundColor: AppColor.primaryColor,
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                decoration:
                    const BoxDecoration(gradient: AppColor.primaryGradient),
                child: const Center(
                    child: Image(image: AssetImage(AppImages.logoImage))),
              ));
        });
  }
}
