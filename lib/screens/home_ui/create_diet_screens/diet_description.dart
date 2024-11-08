import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DietDescription extends StatelessWidget {
  const DietDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: AppStrings.createFood,
        onTap: () {
          Get.back();
        },
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            3.ySpace,
          Text(AppStrings.foodDescription,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            1.ySpace,
            CustomTextField(context: context,
            hintText: AppStrings.lemonPieFilled,
            ),
            1.ySpace,
            CustomTextField(context: context,
              prefixText: '${AppStrings.portion}:',
              suffixText: AppStrings.grams,
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            1.ySpace,
            CustomTextField(context: context,
               prefixText: '${AppStrings.caloriesPerServing}:',
              suffixText: AppStrings.kcal,
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            2.ySpace,
            Text(AppStrings.macronutrients,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            1.ySpace,
            CustomTextField(context: context,
              prefixText: '${AppStrings.carbohydrate}:',
              suffixText: AppStrings.grams,
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            1.ySpace,
            CustomTextField(context: context,
              prefixText: '${AppStrings.protein}:',
              suffixText: AppStrings.grams,
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            1.ySpace,
            CustomTextField(context: context,
              prefixText:'${AppStrings.fat}:',
              suffixText: AppStrings.grams,
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
              textInputAction: TextInputAction.done,
            ),

            ],),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.info, color: AppColor.greyColor),
              15.width,
              Expanded(
                child: KText(text:
                  AppStrings.nutritionalInformationBasedOnIngredients,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor,
                  ),
              ),
            ],
          ),
          2.ySpace,
          kTextButton(
            onPressed: () {
              Get.back();
              Get.back();
              Get.back();
              Get.back();
            },
            btnText: AppStrings.confirmAndCreate,
            gradient: AppColor.greenGradient,
          ),
        ],
      ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
    );

  }
}
