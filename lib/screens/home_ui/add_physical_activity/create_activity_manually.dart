import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/activity_edited.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateActivityManually extends StatelessWidget {
  CreateActivityManually({super.key});
  final HomeController controller = Get.find<HomeController>(tag: 'homeController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Get.back();
        },
        title: AppStrings.createPhysicalActivity,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            3.ySpace,
            KText(text:
              AppStrings.namePhysicalActivity,
              fontSize: 16, fontWeight: FontWeight.w600
            ),
            1.ySpace,
            CustomTextField(
              context: context,
              hintText: '${AppStrings.example}: ${AppStrings.walking}',
              textInputType: TextInputType.text,
            ),
            2.ySpace,
            Text(
              AppStrings.totalDuration,
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            1.ySpace,
            CustomTextField(
              context: context,
              prefixText: AppStrings.duration,
              suffixText: ' ${AppStrings.min}',
              textDirection: TextDirection.ltr,
              textInputType: TextInputType.number,
            ),
            2.ySpace,
            Text(
              AppStrings.caloriesBurned,
              style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            1.ySpace,
            CustomTextField(
              context: context,
              prefixText: AppStrings.calories,
              suffixText: ' ${AppStrings.kcal}',
              textDirection: TextDirection.ltr,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),

      bottomNavigationBar: kTextButton(
        onPressed: () {
          Get.to(() => const ActivityEdited());
        },
        btnText: AppStrings.confirmAndCreate,
        useGradient: true
      ).paddingSymmetric(horizontal: 5.w, vertical: 3.h),
    );
  }
}

