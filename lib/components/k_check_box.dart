import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/auth_ui/forgot_password/forgot_password.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatelessWidget {
  final Color? chkBorderColor;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.chkBorderColor,
  });
  final RxBool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked.value,
          onChanged: (bool? value) {
            isChecked.value = value!;
            onChanged(isChecked.value);
          },
          checkColor: Colors.white,
          activeColor: AppColor.startGradient,
          side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
              color: states.contains(WidgetState.selected)
                  ? AppColor.startGradient
                  : chkBorderColor ?? AppColor.greyColor,
              width: 1.5,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
          KText(text: AppStrings.rememberMe,
              fontSize: 14.0,
              color: AppColor.blackColor,
          ),
          const Spacer(),
          GradientText(
            text: AppStrings.forgotPassword,
            onTextTap: (){
              Get.to(()=> const ForgotPassword());
            },
            gradient: AppColor.primaryGradient,
            style: kTextStyle(
              fontSize: 14.0,
              textDecoration: TextDecoration.underline,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    ));
  }
}

class CustomRegisterCheckbox extends StatelessWidget {
  final Color? chkBorderColor;

  const CustomRegisterCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.chkBorderColor,
  });
  final RxBool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked.value,
          onChanged: (bool? value) {
            isChecked.value = value!;
            onChanged(isChecked.value);
          },
          checkColor: Colors.white,
          activeColor: AppColor.startGradient,
          side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
              color: states.contains(WidgetState.selected)
                  ? AppColor.startGradient
                  : chkBorderColor ?? AppColor.greyColor,
              width: 1.5,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        KText(text:
          AppStrings.iAgreeWithThe,
            fontSize: 14.0,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w500,
        ),
        5.width,
        GradientText(
          text: AppStrings.termsConditions,
          onTextTap: (){},
          gradient: AppColor.primaryGradient,
          style: kTextStyle(
            fontSize: 14.0,
            textDecoration: TextDecoration.underline,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ));
  }
}


class CustomSwitchTile extends StatelessWidget {
  final RxBool value;
  final Function(bool) onChanged;
  final String title;
  final double? fontSize;
  const CustomSwitchTile({super.key, required this.value, required this.onChanged, required this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Obx(()=> ListTile(
        title: KText(text: title,fontSize: fontSize??15,fontWeight: FontWeight.w500),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        shape: RoundedRectangleBorder(side: const BorderSide(color: AppColor.lightGreyBorder),borderRadius: BorderRadius.circular(10)),
        trailing: CupertinoSwitch(
            value: value.value,
            onChanged: onChanged,
          activeColor: AppColor.startGradient,
        ),
      ),
    );
  }
}
