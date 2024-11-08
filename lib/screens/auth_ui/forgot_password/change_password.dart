import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/password_changed.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: Get.put(AuthController()),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: () => Navigator.pop(context),
          ),
          body:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                    height: 22.h,
                    width: 35.w,
                    child:const  Image(image: AssetImage(AppImages.changePasswordImg))),
                4.ySpace,
                KText(
                    text: AppStrings.recoverAccount,fontSize: 20,fontWeight: FontWeight.w700
                ),
                1.ySpace,
                KText(
                  text:  AppStrings.createNewPassword,
                  textAlign: TextAlign.center,),
                2.ySpace,
                Align(
                    alignment: Alignment.topLeft,
                    child: KText(text: AppStrings.newPassword,)),
                GetTextField(
                  context: context,
                  hintText: AppStrings.enterNewPassword,
                  prefixIcon: AppIcons.keyBoardIcon,
                  obSecureText: c.showPassword.value,
                  suffixIcon: c.showPassword.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  suffixOnTap: () {
                    c.togglePassword();
                  },
                ),
                2.ySpace,
                Align(
                    alignment: Alignment.topLeft,
                    child: KText(text:  AppStrings.confirmPassword)),
                GetTextField(
                  context: context,
                  hintText: AppStrings.enterNewPassword,
                  prefixIcon: AppIcons.keyBoardIcon,
                  obSecureText: c.showPassword.value,
                  suffixIcon: c.showPassword.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  suffixOnTap: () {
                    c.togglePassword();
                  },
                  textInputAction: TextInputAction.done,
                ),
              ],),
          ),

          bottomNavigationBar: kTextButton(
              onPressed: (){
                Get.to(()=> const PasswordChanged());
              },
              btnText: AppStrings.continuue,
              useGradient: true
          ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
        );
      }
    );
  }
}
