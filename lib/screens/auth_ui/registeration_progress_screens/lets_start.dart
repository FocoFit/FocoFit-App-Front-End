import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  KText(
                      text: AppStrings.allSetLetsGo,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  KText(
                    text: AppStrings.newJourney,
                    textAlign: TextAlign.center,
                  ),
                  const Image(image: AssetImage(AppImages.letsStartImg)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: kTextButton(
              onPressed: () {
                Get.offAll(() => CustomBottomBar());
              },
              btnText: AppStrings.letsGo,
              useGradient: true)
          .paddingSymmetric(horizontal: 5.w, vertical: 3.h),
    );
  }
}
