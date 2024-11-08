import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/auth_ui/login_screen.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: kAppBar(
        onTap: () => Navigator.pop(context),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 20.h,
                width: 50.w,
                child:const  Image(image: AssetImage(AppImages.greenCheckImg))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: KText(
                  text: AppStrings.passwordChangedSuccessfully,
                  textAlign: TextAlign.center,
                  fontSize: 20,fontWeight: FontWeight.w700
              ),
            ),

          ],),
      ),
      bottomNavigationBar: kTextButton(
          onPressed: (){
            Get.offAll(()=> const LoginScreen());
          },
          btnText: AppStrings.backAndEnter,
          useGradient: true
      ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
    );
  }
}
