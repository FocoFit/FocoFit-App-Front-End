import 'package:flutter/material.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_height.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/convert.dart';
import 'package:get/get.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KPersonalDataSheet {
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
          height: mQ.height * heightFactor,
          width: mQ.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.isKeyboardVisible ? 30.height : 2.height,
                _buildHeader(),
                20.height,
                _buildTitle(title),
                const Divider(
                  color: AppColor.lightGreyBorder,
                ),
                10.height,
                ...content,
                const Spacer(),
                _buildConfirmButton(onConfirmTap),
                3.ySpace,
              ],
            ).paddingSymmetric(horizontal: 4.w),
          ),
        );
      },
    );
  }

  static void editHeight(BuildContext context,
      {Function()? onConfirmTap,
      required ProfileController profileController}) {
    show(
      context: context,
      title: AppStrings.height,
      content: [
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeightContainer(
                  text: 'cm',
                  isSelected: profileController.selectedHeight.value == 'cm',
                  onTap: () {
                    profileController.selectedHeight.value = 'cm';
                  },
                ),
                20.width,
                HeightContainer(
                  text: 'ft/In',
                  isSelected: profileController.selectedHeight.value == 'ft/In',
                  onTap: () {
                    profileController.selectedHeight.value = 'ft/In';
                  },
                ),
              ],
            )),
        15.height,
        Obx(() => profileController.selectedHeight.value == 'ft/In'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ListWheelScrollView.useDelegate(
                      controller: profileController.ftController,
                      onSelectedItemChanged: (value) {
                        profileController.heightInFt.value = value;
                      },
                      itemExtent: 65,
                      perspective: 0.006,
                      diameterRatio: 1.9,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 21,
                        builder: (context, index) {
                          return Obx(
                            () => Center(
                              child: index == profileController.heightInFt.value
                                  ? GradientText(
                                      text: index.toString(),
                                      gradient: AppColor.primaryGradient,
                                      style: kTextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : KText(
                                      text: index.toString(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.7)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const KText(
                    text: 'ft',
                  ),
                  20.width,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ListWheelScrollView.useDelegate(
                      controller: profileController.inchController,
                      onSelectedItemChanged: (value) {
                        profileController.heightInch.value = value;
                      },
                      itemExtent: 65,
                      perspective: 0.006,
                      diameterRatio: 1.9,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 13,
                        builder: (context, index) {
                          return Obx(
                            () => Center(
                              child: index == profileController.heightInCm.value
                                  ? GradientText(
                                      text: index.toString(),
                                      gradient: AppColor.primaryGradient,
                                      style: kTextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : KText(
                                      text: index.toString(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.7)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const KText(
                    text: 'in',
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ListWheelScrollView.useDelegate(
                      controller: profileController.cmController,
                      onSelectedItemChanged: (value) {
                        profileController.heightInCm.value = value;
                      },
                      itemExtent: 65,
                      perspective: 0.006,
                      diameterRatio: 1.9,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 500,
                        builder: (context, index) {
                          return Obx(
                            () => Center(
                              child: index == profileController.heightInCm.value
                                  ? GradientText(
                                      text: index.toString(),
                                      gradient: AppColor.primaryGradient,
                                      style: kTextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : KText(
                                      text: index.toString(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.7)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    'cm',
                    textAlign: TextAlign.end,
                    style: primaryTextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              )),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.65, // Increased heightFactor
    );
  }

  static void editDateBirth(
    BuildContext context, {
    required ProfileController profileController,
    required AuthController authController,
  }) {
    show(
      context: context,
      title: AppStrings.dateOfBirth,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Date ScrollView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.dateController,
                onSelectedItemChanged: (value) {
                  profileController.currentDate.value = value + 1;
                },
                itemExtent: 60,
                perspective: 0.009,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 31,
                  builder: (context, index) {
                    return Obx(() => Center(
                          child:
                              index + 1 == profileController.currentDate.value
                                  ? GradientText(
                                      text: (index + 1).toString(),
                                      gradient: AppColor.primaryGradient,
                                      style: kTextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : KText(
                                      text: (index + 1).toString(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                        ));
                  },
                ),
              ),
            ),
            const KText(
              text: '/',
              fontSize: 20,
            ),
            // Month ScrollView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.monthController,
                onSelectedItemChanged: (value) {
                  profileController.currentMonth.value = value + 1;
                },
                itemExtent: 60,
                perspective: 0.009,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 12,
                  builder: (context, index) {
                    return Obx(() => Center(
                          child:
                              index + 1 == profileController.currentMonth.value
                                  ? GradientText(
                                      text: (index + 1).toString(),
                                      gradient: AppColor.primaryGradient,
                                      style: kTextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : KText(
                                      text: (index + 1).toString(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                        ));
                  },
                ),
              ),
            ),
            const KText(
              text: '/',
              fontSize: 20,
            ),
            // Year ScrollView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.3,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.yearController,
                onSelectedItemChanged: (value) {
                  profileController.currentYear.value = 1990 + value;
                },
                itemExtent: 60,
                perspective: 0.009,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: profileController.currentYearValue - 1990 + 1,
                  builder: (context, index) {
                    return Obx(() => Center(
                          child: 1990 + index ==
                                  profileController.currentYear.value
                              ? GradientText(
                                  text: (1990 + index).toString(),
                                  gradient: AppColor.primaryGradient,
                                  style: kTextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : KText(
                                  text: (1990 + index).toString(),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      ],
      onConfirmTap: () async {
        DateTime dob = DateTime(
            profileController.currentYear.toInt(),
            profileController.currentMonth.toInt(),
            profileController.currentDate.toInt());
        String isoString =
        Convert.convertToIso8601String(dob);

        await authController.updateDob(isoString);

        Get.back();
      },
      heightFactor: 0.45,
    );
  }

  static void editGender(BuildContext context,
      {Function()? onConfirmTap,
      required ProfileController profileController}) {
    show(
      context: context,
      title: AppStrings.gender,
      content: [
        1.ySpace,
        for (int i = 0; i < profileController.genderList.length; i++)
          Obx(
            () => Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              child: ListTile(
                onTap: () {
                  profileController.selectedGenderIndex.value = i;
                },
                title: KText(
                    text: profileController.genderList[i].toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: profileController.selectedGenderIndex.value == i
                        ? AppColor.startGradient
                        : AppColor.greyBorder,
                  ),
                ),
              ),
            ),
          ),
        3.ySpace,
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.54,
    );
  }

  static void editCurrentWeight(BuildContext context,
      {Function()? onConfirmTap,
      required ProfileController profileController}) {
    show(
      context: context,
      title: AppStrings.currentWeight,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.kgController,
                onSelectedItemChanged: (value) {
                  profileController.selectedWeightKg.value = value;
                },
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 120,
                  builder: (context, index) {
                    return Obx(
                      () => Center(
                        child: index == profileController.selectedWeightKg.value
                            ? GradientText(
                                text: index.toString(),
                                gradient: AppColor.primaryGradient,
                                style: kTextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              )
                            : KText(
                                text: index.toString(),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7)),
                      ),
                    );
                  },
                ),
              ),
            ),
            const KText(
              text: 'Kg',
            ),
            20.width,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.grController,
                onSelectedItemChanged: (value) {
                  profileController.selectedWeightGr.value = value;
                },
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 1000,
                  builder: (context, index) {
                    return Obx(
                      () => Center(
                        child: index == profileController.selectedWeightGr.value
                            ? GradientText(
                                text: index.toString(),
                                gradient: AppColor.primaryGradient,
                                style: kTextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              )
                            : KText(
                                text: index.toString(),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7)),
                      ),
                    );
                  },
                ),
              ),
            ),
            const KText(
              text: 'Gr',
            ),
          ],
        ),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.5,
    );
  }

  static void editGoalWeight(BuildContext context,
      {Function()? onConfirmTap,
      required ProfileController profileController}) {
    show(
      context: context,
      title: AppStrings.goalWeight,
      content: [
        2.ySpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.kgController,
                onSelectedItemChanged: (value) {
                  profileController.selectedWeightKg.value = value;
                },
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 120,
                  builder: (context, index) {
                    return Obx(
                      () => Center(
                        child: index == profileController.selectedWeightKg.value
                            ? GradientText(
                                text: index.toString(),
                                gradient: AppColor.primaryGradient,
                                style: kTextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              )
                            : KText(
                                text: index.toString(),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7)),
                      ),
                    );
                  },
                ),
              ),
            ),
            const KText(
              text: 'Kg',
              textAlign: TextAlign.end,
            ),
            20.width,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: profileController.grController,
                onSelectedItemChanged: (value) {
                  profileController.selectedWeightGr.value = value;
                },
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 1000,
                  builder: (context, index) {
                    return Obx(
                      () => Center(
                        child: index == profileController.selectedWeightGr.value
                            ? GradientText(
                                text: index.toString(),
                                gradient: AppColor.primaryGradient,
                                style: kTextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              )
                            : KText(
                                text: index.toString(),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7)),
                      ),
                    );
                  },
                ),
              ),
            ),
            const KText(
              text: 'Gr',
              textAlign: TextAlign.end,
            ),
          ],
        ),
        2.ySpace,
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.5,
    );
  }

  static void editActivityLevel(BuildContext context,
      {Function()? onConfirmTap,
      required ProfileController profileController}) {
    show(
      context: context,
      title: AppStrings.activityLevel,
      content: [
        1.ySpace,
        for (int i = 0; i < profileController.activityLevelList.length; i++)
          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                onTap: () {
                  profileController.selectedGenderIndex.value = i;
                },
                title: KText(
                    text:
                        profileController.activityLevelList[i].title.toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                subtitle: KText(
                    text: profileController.activityLevelList[i].subTitle
                        .toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: profileController.selectedGenderIndex.value == i
                        ? AppColor.startGradient
                        : AppColor.greyBorder,
                  ),
                ),
              ),
            ),
          ),
        3.ySpace,
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.74,
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
      child: Text(
        title,
        style: primaryTextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: 'Salvar',
      useGradient: true,
    );
  }
}

// static void editHistoricoSheet(BuildContext context, {
//   required Function() onConfirmTap,
//   required Function() onCancelTap}) {
//   show(
//     context: context,
//     title: 'Editar histórico',
//     content: [
//       Align(
//           alignment: Alignment.center,
//           child: Text('O que deseja fazer com este histórico?',
//             textAlign: TextAlign.center,
//             style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),)),
//       const Spacer(),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           KOutlineButton(
//             onTap: onCancelTap,
//             btnText: 'Excluir',
//             gradient: AppColor.blackGradient,
//             textGradient: AppColor.blackGradient,
//             width:120,
//           ),
//           kTextButton(
//             onPressed: onConfirmTap,
//             btnText: 'Alterar',
//             useGradient: true,
//             width:120,
//           ),
//         ],
//       ),
//     ],
//     heightFactor: 0.25, onConfirmTap: () { },
//   );
// }
