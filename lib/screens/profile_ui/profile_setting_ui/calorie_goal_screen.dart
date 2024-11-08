import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CalorieGoalScreen extends StatelessWidget {
  CalorieGoalScreen({super.key});
  final ProfileController c = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: AppStrings.calorieGoal,
        titleSize: 18,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Switch tile to enable/disable recalculation
            CustomSwitchTile(
              value: c.recalculateCalorieLimit,
              onChanged: (v) {
                c.recalculateCalorieLimit.value = v;
              },
              title: AppStrings.automaticallyRecalculateLimit,
            ),
            3.ySpace,
            Obx(() => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: !c.recalculateCalorieLimit.value
                      ? AppColor.greyBorder
                      : AppColor.greyColor.withOpacity(0.4),
                ),
                color: !c.recalculateCalorieLimit.value
                    ? Colors.white : AppColor.lightGreyColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  KText(
                    text: AppStrings.breakFast,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: !c.recalculateCalorieLimit.value
                        ? Colors.black
                        : AppColor.greyBorder,
                  ),
                  15.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _calorieDetailBox(
                        context: context,
                        hintText: '33',
                        unit: '%',
                        isEnabled: !c.recalculateCalorieLimit.value, // Disable if switch is ON
                      ),
                      _calorieDetailBox(
                        context: context,
                        hintText: '1500',
                        unit: AppStrings.kcal,
                        isEnabled: !c.recalculateCalorieLimit.value, // Disable if switch is ON
                      ),
                    ],
                  ),
                ],
              ),
            )),
            2.ySpace,
            Obx(() => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: !c.recalculateCalorieLimit.value
                      ? AppColor.greyBorder
                      : AppColor.greyColor.withOpacity(0.4),
                ),
                color: !c.recalculateCalorieLimit.value
                    ? Colors.white : AppColor.lightGreyColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  KText(
                    text: AppStrings.lunch,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: !c.recalculateCalorieLimit.value
                        ? Colors.black
                        : AppColor.greyBorder,
                  ),
                  15.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _calorieDetailBox(
                        context: context,
                        hintText: '33',
                        unit: '%',
                        isEnabled: !c.recalculateCalorieLimit.value, // Disable if switch is ON
                      ),
                      _calorieDetailBox(
                        context: context,
                        hintText: '1500',
                        unit: AppStrings.kcal,
                        isEnabled: !c.recalculateCalorieLimit.value, // Disable if switch is ON
                      ),
                    ],
                  ),
                ],
              ),
            )),
            2.ySpace,
            Obx(() => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: !c.recalculateCalorieLimit.value
                      ? AppColor.greyBorder
                      : AppColor.greyColor.withOpacity(0.4),
                ),
                color: !c.recalculateCalorieLimit.value
                    ? Colors.white : AppColor.lightGreyColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  KText(
                    text: AppStrings.toHaveLunch,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: !c.recalculateCalorieLimit.value
                        ? Colors.black
                        : AppColor.greyBorder,
                  ),
                  15.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _calorieDetailBox(
                        context: context,
                        hintText: '33',
                        unit: '%',
                        isEnabled: !c.recalculateCalorieLimit.value, // Disable if switch is ON
                      ),
                      _calorieDetailBox(
                        context: context,
                        hintText: '1500',
                        unit: AppStrings.kcal,
                        isEnabled: !c.recalculateCalorieLimit.value, // Disable if switch is ON
                      ),
                    ],
                  ),
                ],
              ),
            )),
            2.ySpace,
            Obx(() => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: !c.recalculateCalorieLimit.value
                      ? AppColor.greyBorder
                      : AppColor.greyColor.withOpacity(0.4),
                ),
                color: !c.recalculateCalorieLimit.value
                    ? Colors.white : AppColor.lightGreyColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  KText(
                    text: AppStrings.snacks,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: !c.recalculateCalorieLimit.value
                        ? Colors.black
                        : AppColor.greyBorder,
                  ),
                  15.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _calorieDetailBox(
                        context: context,
                        hintText: '33',
                        unit: '%',
                        isEnabled: !c.recalculateCalorieLimit.value, // Disable if switch is ON
                      ),
                      _calorieDetailBox(
                        context: context,
                        hintText: '1500',
                        unit: AppStrings.kcal,
                        isEnabled: !c.recalculateCalorieLimit.value, // Disable if switch is ON
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ).paddingSymmetric(horizontal: 4.w, vertical: 2.h),
      ),
      bottomNavigationBar: kTextButton(
        onPressed: () {},
        btnText: AppStrings.save,
        useGradient: true,
      ).paddingSymmetric(horizontal: 5.w, vertical: 3.h),
    );
  }

  Widget _calorieDetailBox({
    required BuildContext context,
    required String hintText,
    required String unit,
    required bool isEnabled,
  }) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isEnabled
                  ? AppColor.greyBorder
                  : AppColor.greyColor.withOpacity(0.4),
            ),
          ),
          child: TextFormField(
            enabled: isEnabled,
            onTap: () {
              context.dismissKeyBoard();
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hintText,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: kTextStyle(
                  color: isEnabled ? Colors.black : AppColor.greyBorder
              ),
            ),
          ),
        ),
        5.width,
        KText(
          text: unit,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isEnabled ? Colors.black : AppColor.greyBorder,
        ),
      ],
    );
  }
}


