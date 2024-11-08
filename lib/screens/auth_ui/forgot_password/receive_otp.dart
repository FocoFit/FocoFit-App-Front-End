import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/change_password.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init:  Get.put(AuthController()),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: () => Navigator.pop(context),
          ),
          body:Column(
            children: [
               SizedBox(
                  height: 22.h,
                  width: 35.w,
                  child:const  Image(image: AssetImage(AppImages.otpImg))),
              4.ySpace,
              KText(text:  AppStrings.enterVerificationCode,fontSize: 20,fontWeight: FontWeight.w700),
              1.ySpace,
              KText(text:  AppStrings.enterCodeSentByEmail,textAlign: TextAlign.center,),
              3.ySpace,
              PinCodeFields(controller: c,),
            ],).paddingSymmetric(horizontal: 3.w,vertical: 1.h),

          bottomNavigationBar: kTextButton(
              onPressed: (){
                Get.to(()=> const ChangePassword());
              },
              btnText: AppStrings.continuue,
              useGradient: true
          ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
        );
      }
    );
  }
}
