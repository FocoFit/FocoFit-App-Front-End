import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/create_diet_screens/diet_added.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateDietManually extends StatelessWidget {
  const CreateDietManually({super.key});

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
            KText(text:  AppStrings.foodDescription,fontSize: 16,fontWeight: FontWeight.w500),
            1.ySpace,
            CustomTextField(context: context,
              hintText: AppStrings.carrotCake,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
              textInputType: TextInputType.text,
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
            KText(text: AppStrings.macronutrients,fontSize: 16,fontWeight: FontWeight.w400),
            1.ySpace,
            CustomTextField(context: context,
              prefixText: '${AppStrings.carbohydrates}:',
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
              prefixText: '${AppStrings.fat}:',
              suffixText: AppStrings.grams,
              textDirection: TextDirection.rtl,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
              textInputAction: TextInputAction.done,
            ),

          ],),
      ),
      bottomNavigationBar: kTextButton(
        onPressed: () {
          Get.to(()=> const DietAdded());
        },
        btnText: AppStrings.confirmAndCreate,
        gradient: AppColor.greenGradient,
      ).paddingSymmetric(horizontal: 5.w, vertical: 3.h),
    );
  }
}
