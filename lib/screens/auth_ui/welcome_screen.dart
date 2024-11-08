import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/login_screen.dart';
import 'package:focofit/screens/auth_ui/register_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 40.h,
                width: 40.w,
                child:
                    const Image(image: AssetImage(AppImages.blackLogoImage))),
            5.ySpace,
            KText(
                text: AppStrings.welcomeNote,
                fontSize: 20,
                fontWeight: FontWeight.w700),
            KText(
                text: AppStrings.loginNote,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kTextButton(
            onPressed: () {
              Get.to(() => const RegisterScreen());
            },
            btnText: AppStrings.createAccount,
            useGradient: true,
            fontSize: 16,
          ),
          2.ySpace,
          KOutlineButton(
            onTap: () {
              Get.to(() => const LoginScreen());
            },
            btnText: AppStrings.login,
            gradient: AppColor.primaryGradient,
            fontSize: 16,
          ),
        ],
      ).paddingSymmetric(horizontal: 4.w, vertical: 4.h),
    );
  }
}
