import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectMedicalConditions extends StatelessWidget {
  const SelectMedicalConditions({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedList = [].obs;
    final indexList = List<int>.filled(madicalList.length, 0).obs;

    return GetBuilder<AuthController>(
        init: Get.put(AuthController()),
        builder: (c) {
          return Scaffold(
            appBar: kAppBar(onTap: () {
              Navigator.pop(context);
            }),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: AppStrings.haveAnyMedicalConditions,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
                20.height,
                Expanded(
                  child: ListView.separated(
                    itemCount: madicalList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return 15.height;
                    },
                    itemBuilder: (context, index) {
                      return Obx(
                        () => ListTile(
                          onTap: () {
                            if (index == madicalList.length - 1) {
                              indexList.fillRange(
                                  0, indexList.length, 0); // Deselect all
                              selectedList.clear(); // Clear the selected list
                              indexList[index] = 1; // Select "None"
                              selectedList.add(madicalList[index]);
                            } else {
                              if (indexList[index] == 0) {
                                indexList[index] = 1;
                                selectedList.add(madicalList[index]);
                                indexList[madicalList.length - 1] =
                                    0; // Deselect "None"
                                selectedList.remove(
                                    madicalList[madicalList.length - 1]);
                              } else {
                                indexList[index] = 0;
                                selectedList.remove(madicalList[index]);
                              }
                            }
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: indexList[index] == 1
                                      ? AppColor.startGradient
                                      : AppColor.greyColor,
                                  width: indexList[index] == 1 ? 2 : 1)),
                          title: KText(text: madicalList[index]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 15, vertical: 10),
            bottomNavigationBar: kTextButton(
                    onPressed: () async {
                      print(selectedList);
                      await c.updateMedicalConditions(selectedList);
                    },
                    btnText: AppStrings.continuue,
                    useGradient: true)
                .paddingSymmetric(horizontal: 5.w, vertical: 3.h),
          );
        });
  }

  static final madicalList = [
    AppStrings.diabetes,
    AppStrings.hyperTension,
    AppStrings.heartDisease,
    AppStrings.highCholesterol,
    AppStrings.thyroidDisease,
    AppStrings.none,
  ].obs;
}
