import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/receive_otp.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: kAppBar(
        onTap: () => Navigator.pop(context),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 22.h,
              width: 50.w,
              child: const Image(image: AssetImage(AppImages.forgotImage))),
          3.ySpace,
          KText(text: AppStrings.forgotPassword,fontSize: 20,fontWeight: FontWeight.w700),
          1.ySpace,
          KText(
            text: AppStrings.enterEmailReceiveLink,
            textAlign: TextAlign.center,),
            2.ySpace,
          Align(
              alignment: Alignment.topLeft,
              child: KText(text:  AppStrings.email,)),
          GetTextField(
            context: context,
            hintText: AppStrings.enterEmail,
            obSecureText: false,
            prefixIcon: AppIcons.emailIcon,
            textInputAction: TextInputAction.done,
          ),

        ],),
      ),
      bottomNavigationBar: kTextButton(
          onPressed: (){
            Get.to(()=> const OtpScreen());
          },
          btnText: AppStrings.continuue,
          useGradient: true
      ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
    );
  }
}
