import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';

class KBottomSheet {
  // Common method to show the bottom sheet
  static void show({
    required BuildContext context,
    required String title,
    required List<Widget> content,
    required Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: context.isKeyboardVisible ? mQ.height : mQ.height * heightFactor,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.isKeyboardVisible ? 30.height : 2.height,
                _buildHeader(),
                3.ySpace,
                _buildTitle(title),
                const Divider(color: AppColor.lightGreyBorder,),
                10.height,
                ...content,
                const Spacer(),
                _buildConfirmButton(onConfirmTap),
                3.ySpace,
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
        );
      },
    );
  }

  static void editEmail(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.changeEmail,
      content: [
        _buildTextField(context: context, label: AppStrings.newEmail, hintText: AppStrings.newEmail, ),
        2.ySpace,
        _buildTextField(context: context, label: AppStrings.confirmEmail, hintText: AppStrings.confirmEmail,textInputAction: TextInputAction.done ),
        3.ySpace,
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.45,
    );
  }

  static void editPassword(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.changePassword,
      content: [
        _buildTextField(label: AppStrings.oldPassword, hintText: AppStrings.oldPassword, context: context),
        2.ySpace,
        _buildTextField(label: AppStrings.newPassword, hintText: AppStrings.newPassword, context: context),
        2.ySpace,
        _buildTextField(label: AppStrings.confirmPassword, hintText: AppStrings.confirmPassword, context: context,textInputAction: TextInputAction.done),
      3.ySpace,
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.56,
    );
  }

  static void editPhone(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.changeCellPhone,
      content: [
        _buildTextField(hintText: '(16) 99999-9999', context: context,textInputAction: TextInputAction.done),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.3,
    );
  }

  static Widget _buildHeader() {
    return Align(
      alignment: Alignment.center,
      child: showSvgIconWidget(iconPath: AppIcons.dashIcon),
    );
  }

  static Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.center,
      child: KText(text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget _buildTextField({
    required BuildContext context,
    String? label,
    TextInputAction? textInputAction,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          KText(text: label,
            textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
          ),
    CustomTextField(context: context,
    hintText: hintText,
      color: Colors.white,
      borderColor: AppColor.greyColor,
      textInputType: TextInputType.text,
      textInputAction: textInputAction,
    ),
      ],
    );
  }

  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: AppStrings.save,
      useGradient: true,
      height: 7
    );
  }
}
