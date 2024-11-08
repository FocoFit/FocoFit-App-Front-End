import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/extensions/text_capital_extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectWeight extends StatelessWidget {
  SelectWeight({super.key});

  final FixedExtentScrollController _kgController =
      FixedExtentScrollController();
  final FixedExtentScrollController _grController =
      FixedExtentScrollController();

  final RxInt selectedWeightKg = 0.obs;
  final RxInt selectedWeightGr = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: Get.put(AuthController()),
        builder: (c) {
          return Scaffold(
            appBar: kAppBar(onTap: () {
              Navigator.pop(context);
            }),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  2.ySpace,
                  KText(
                    text: AppStrings.whatYourCurrentWeight,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                  1.ySpace,
                  KText(
                    text: AppStrings.knowingYourCurrentWeightHelpGoals,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ListWheelScrollView.useDelegate(
                          controller: _kgController,
                          onSelectedItemChanged: (value) {
                            selectedWeightKg.value = value;
                          },
                          itemExtent: 65,
                          perspective: 0.006,
                          diameterRatio: 1.9,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 120,
                            builder: (context, index) {
                              return Obx(
                                () => Center(
                                  child: index == selectedWeightKg.value
                                      ? GradientText(
                                          text: index.toString(),
                                          gradient: AppColor.primaryGradient,
                                          style: kTextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                        )
                                      : KText(
                                          text: index.toString(),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.7)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const KText(
                        text: ',',
                      ),
                      // const KText(
                      //   text: 'Kg',
                      // ),
                      // const SizedBox(width: 20), // Added SizedBox
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ListWheelScrollView.useDelegate(
                          controller: _grController,
                          // Use a different controller for the second ListWheelScrollView
                          onSelectedItemChanged: (value) {
                            selectedWeightGr.value = value;
                          },
                          itemExtent: 65,
                          perspective: 0.006,
                          diameterRatio: 1.9,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 1000,
                            builder: (context, index) {
                              return Obx(
                                () => Center(
                                  child: index == selectedWeightGr.value
                                      ? GradientText(
                                          text: index.toString(),
                                          gradient: AppColor.primaryGradient,
                                          style: kTextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                        )
                                      : KText(
                                          text: index.toString(),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const KText(
                        text: 'kg',
                      ),
                      // const KText(
                      //   text: 'Gr',
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: kTextButton(
                    onPressed: () async {
                      final currentWeight =
                          '${selectedWeightKg.value}.${selectedWeightGr.value}'
                              .toDouble();
                      await c.updateCurrentWeight(currentWeight);
                    },
                    btnText: AppStrings.continuue,
                    useGradient: true)
                .paddingSymmetric(horizontal: 5.w, vertical: 3.h),
          );
        });
  }
}
