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

class SelectHeight extends StatefulWidget {
  const SelectHeight({super.key});

  @override
  State<SelectHeight> createState() => _SelectHeightState();
}

class _SelectHeightState extends State<SelectHeight> {
  // final FixedExtentScrollController _cmController =
  //     FixedExtentScrollController();

  final FixedExtentScrollController _ftController =
      FixedExtentScrollController();

  final FixedExtentScrollController _inchController =
      FixedExtentScrollController();

  RxString selectedHeight = 'cm'.obs;

  RxInt heightInFt = 0.obs;

  RxInt heightInch = 0.obs;

  // RxInt heightInCm = 0.obs;

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
                  KText(
                    text: AppStrings.howTallAreYou,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                  KText(
                    text: AppStrings.yourHeightHelpCalculateMass,
                    textAlign: TextAlign.start,
                  ),
                  // Obx(() => Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         HeightContainer(
                  //             text: 'cm',
                  //             isSelected: selectedHeight.value == 'cm',
                  //             onTap: () {
                  //               selectedHeight.value = 'cm';
                  //               heightInCm.value = 0;
                  //             }),
                  //         20.width,
                  //         HeightContainer(
                  //             text: 'ft/In',
                  //             isSelected: selectedHeight.value == 'ft/In',
                  //             onTap: () {
                  //               selectedHeight.value = 'ft/In';
                  //               heightInFt.value = 0;
                  //               heightInch.value = 0;
                  //             }),
                  //       ],
                  //     )),
                  // selectedHeight.value == 'ft/In' ?
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ListWheelScrollView.useDelegate(
                          controller: _ftController,
                          onSelectedItemChanged: (value) {
                            heightInFt.value = value;
                          },
                          itemExtent: 65,
                          perspective: 0.006,
                          diameterRatio: 1.9,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 501,
                            builder: (context, index) {
                              return Obx(
                                () => Center(
                                  child: index == heightInFt.value
                                      ? GradientText(
                                          text: index.toString(),
                                          gradient: AppColor.primaryGradient,
                                          style: primaryTextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600),
                                        )
                                      : Text(
                                          index.toString(),
                                          style: primaryTextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                                  .withOpacity(0.7)),
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // const KText(
                      //   text: 'ft',
                      // ),
                      const KText(
                        text: ',',
                      ),
                      // const SizedBox(width: 20), // Added SizedBox
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ListWheelScrollView.useDelegate(
                          controller: _inchController,
                          // Use a different controller for the second ListWheelScrollView
                          onSelectedItemChanged: (value) {
                            heightInch.value = value;
                          },
                          itemExtent: 65,
                          perspective: 0.006,
                          diameterRatio: 1.9,
                          physics: const FixedExtentScrollPhysics(),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 11,
                            builder: (context, index) {
                              return Obx(
                                () => Center(
                                  child: index == heightInch.value
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
                      // const KText(
                      //   text: 'in',
                      // ),
                      const KText(
                        text: 'cm',
                      ),
                    ],
                  )
                  // : Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       SizedBox(
                  //         height: MediaQuery.of(context).size.height * 0.45,
                  //         width: MediaQuery.of(context).size.width * 0.25,
                  //         child: ListWheelScrollView.useDelegate(
                  //           controller: _cmController,
                  //           onSelectedItemChanged: (value) {
                  //             heightInCm.value = value;
                  //           },
                  //           itemExtent: 65,
                  //           perspective: 0.006,
                  //           diameterRatio: 1.9,
                  //           physics: const FixedExtentScrollPhysics(),
                  //           childDelegate: ListWheelChildBuilderDelegate(
                  //             childCount: 500,
                  //             builder: (context, index) {
                  //               return Obx(
                  //                 () => Center(
                  //                   child: index == heightInCm.value
                  //                       ? GradientText(
                  //                           text: index.toString(),
                  //                           gradient: AppColor.primaryGradient,
                  //                           style: kTextStyle(
                  //                               fontSize: 24,
                  //                               fontWeight: FontWeight.w600),
                  //                         )
                  //                       : KText(
                  //                           text: index.toString(),
                  //                           fontSize: 20,
                  //                           fontWeight: FontWeight.w500,
                  //                           color:
                  //                               Colors.black.withOpacity(0.7)),
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //       const KText(
                  //         text: 'cm',
                  //         fontSize: 20.0,
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
            ),
            bottomNavigationBar: kTextButton(
                    onPressed: () async {
                      final height =
                          '${heightInFt.value}.${heightInch.value}'.toDouble();
                      await c.updateHeight(height);
                    },
                    btnText: AppStrings.continuue,
                    useGradient: true)
                .paddingSymmetric(horizontal: 5.w, vertical: 3.h),
          );
        });
  }
}

class HeightContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const HeightContainer({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isSelected ? AppColor.primaryGradient : null,
          border: Border.all(
              color: isSelected ? AppColor.startGradient : Colors.black),
          color: isSelected ? AppColor.primaryColor : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: KText(
          text: text,
          fontSize: 15,
          color: isSelected ? AppColor.whiteColor : Colors.black,
        ),
      ),
    );
  }
}
