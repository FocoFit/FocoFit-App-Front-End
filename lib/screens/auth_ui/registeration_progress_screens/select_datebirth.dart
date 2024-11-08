import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/convert.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectDateBirth extends StatelessWidget {
  SelectDateBirth({super.key});

  final FixedExtentScrollController _dateController =
      FixedExtentScrollController();
  final FixedExtentScrollController _monthController =
      FixedExtentScrollController();
  final FixedExtentScrollController _yearController =
      FixedExtentScrollController();

  final RxInt currentDate = 1.obs;
  final RxInt currentMonth = 1.obs;
  final RxInt currentYear = 1990.obs;
  final int currentYearValue = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: Get.put(AuthController()),
        builder: (c) {
          return Scaffold(
            appBar: kAppBar(
              onTap: () {
                Navigator.pop(context);
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  2.ySpace,
                  KText(
                    text: AppStrings.whatsYourBirthDate,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                  1.ySpace,
                  KText(
                    text: AppStrings.yourAgeHelpReferences,
                    textAlign: TextAlign.start,
                  ),
                  2.ySpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Date ScrollView
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ListWheelScrollView.useDelegate(
                          controller: _dateController,
                          onSelectedItemChanged: (value) {
                            currentDate.value = value + 1;
                          },
                          itemExtent: 60,
                          perspective: 0.009,
                          diameterRatio: 2.5,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 31,
                            builder: (context, index) {
                              return Obx(() => Center(
                                    child: index + 1 == currentDate.value
                                        ? GradientText(
                                            text: (index + 1).toString(),
                                            gradient: AppColor.primaryGradient,
                                            style: kTextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        : KText(
                                            text: (index + 1).toString(),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                  ));
                            },
                          ),
                        ),
                      ),
                      const KText(
                        text: '/',
                        fontSize: 24,
                      ),

                      /// Month ScrollView
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ListWheelScrollView.useDelegate(
                          controller: _monthController,
                          onSelectedItemChanged: (value) {
                            currentMonth.value = value + 1;
                          },
                          itemExtent: 60,
                          perspective: 0.009,
                          diameterRatio: 2.5,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 12,
                            builder: (context, index) {
                              return Obx(
                                () => Center(
                                  child: index + 1 == currentMonth.value
                                      ? GradientText(
                                          text: (index + 1).toString(),
                                          gradient: AppColor.primaryGradient,
                                          style: kTextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : KText(
                                          text: (index + 1).toString(),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const KText(
                        text: '/',
                        fontSize: 24,
                      ),
                      // Year ScrollView
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ListWheelScrollView.useDelegate(
                          controller: _yearController,
                          onSelectedItemChanged: (value) {
                            currentYear.value = 1990 + value;
                          },
                          itemExtent: 60,
                          perspective: 0.009,
                          diameterRatio: 2.5,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: currentYearValue - 1990 + 1,
                            builder: (context, index) {
                              return Obx(
                                () => Center(
                                  child: 1990 + index == currentYear.value
                                      ? GradientText(
                                          text: (1990 + index).toString(),
                                          gradient: AppColor.primaryGradient,
                                          style: kTextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : KText(
                                          text: (1990 + index).toString(),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: kTextButton(
                    onPressed: () async {
                      Get.back();

                      DateTime dob = DateTime(currentYear.toInt(),
                          currentMonth.toInt(), currentDate.toInt());
                      String isoString = Convert.convertToIso8601String(dob);

                      await c.updateDob(isoString, isProfile: true);
                    },
                    btnText: AppStrings.continuue,
                    useGradient: true)
                .paddingSymmetric(horizontal: 5.w, vertical: 3.h),
          );
        });
  }
}
