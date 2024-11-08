import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/login_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_app_dialogs.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: Get.put(AuthController()),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: () => Navigator.pop(context),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: KText(
                        text: AppStrings.createYourAccount,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    3.ySpace,
                    KText(
                      text: AppStrings.email,
                    ),
                    GetTextField(
                      context: context,
                      controller: c.emailController,
                      hintText: AppStrings.enterEmail,
                      obSecureText: false,
                      prefixIcon: AppIcons.emailIcon,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    2.ySpace,
                    KText(
                      text: AppStrings.password,
                    ),
                    GetTextField(
                      context: context,
                      controller: c.passwordController,
                      hintText: AppStrings.enterPassword,
                      prefixIcon: AppIcons.keyBoardIcon,
                      obSecureText: c.showPassword.value,
                      suffixIcon: c.showPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      suffixOnTap: () {
                        c.togglePassword();
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    CustomRegisterCheckbox(
                      isChecked: c.isTermsAccepted,
                      onChanged: (bool value) {
                        c.isTermsAccepted.value = value;
                      },
                    ),
                    2.ySpace,
                    kTextButton(
                      btnText: AppStrings.createAccount,
                      onPressed: () async {
                        await c.signUpWithEmail();
                      },
                      useGradient: true,
                    ),
                  ],
                ),
                3.ySpace,
                Column(
                  children: [
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.alreadyHaveAccount,
                              style: kTextStyle(
                                color: AppColor.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                                text: AppStrings.login,
                                style: kTextStyle(
                                  textDecoration: TextDecoration.underline,
                                  color: AppColor.startGradient,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAll(() => const LoginScreen());
                                  }),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            height: 60,
                            color: AppColor.lightGreyBorder,
                            endIndent: 20,
                            indent: 10,
                          ),
                        ),
                        KText(
                          text: AppStrings.or,
                          color: AppColor.greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColor.lightGreyBorder,
                            endIndent: 10,
                            indent: 20,
                          ),
                        ),
                      ],
                    ),
                    kSocialButton(
                        onTap: () {},
                        btnText: AppStrings.continueWithGoogle,
                        imgPath: AppImages.googleImage),
                    kSocialButton(
                        onTap: () {},
                        btnText: AppStrings.continueWithApple,
                        imgPath: AppImages.appleImage),
                    kSocialButton(
                        onTap: () {},
                        btnText: AppStrings.continueWithFacebook,
                        imgPath: AppImages.faceBookImage),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
