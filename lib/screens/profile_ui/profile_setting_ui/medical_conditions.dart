import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MedicalConditions extends StatelessWidget {
  MedicalConditions({super.key});

  final List<String> medicalConditions = [
    AppStrings.hypertension,
    AppStrings.diabetesResistance,
    AppStrings.asthma,
  ];

  final RxList<bool> selectedConditions = List<bool>.filled(7, false).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: AppStrings.medicalConditions,
        titleSize: 18
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            ListView.separated(
              itemCount: medicalConditions.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) { return 2.ySpace; },
              itemBuilder: (context, index) {
                return Obx(() => ListTile(
                  onTap: () {
                    selectedConditions[index] = !selectedConditions[index];
                  },
                  contentPadding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 0),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: selectedConditions[index]
                          ? AppColor.startGradient
                          : AppColor.greyColor,
                      width: selectedConditions[index] ? 1.5 : 1,
                    ),
                  ),
                  title: KText(text: medicalConditions[index],fontSize: 15,fontWeight: FontWeight.w500,
                  ),
                ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: kTextButton(
        onPressed: () {
          List<String> selectedMedicalConditions = [];
          for (int i = 0; i < medicalConditions.length; i++) {
            if (selectedConditions[i]) {
              selectedMedicalConditions.add(medicalConditions[i]);
            }
          }
          print("Selected Conditions: $selectedMedicalConditions");
        },
        btnText: AppStrings.save,
        useGradient: true,
      ).paddingSymmetric(horizontal: 5.w, vertical: 3.h),
    );
  }
}
