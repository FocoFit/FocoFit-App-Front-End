import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/calorie_goal_screen.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/change_app_language.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/macro_nutrients.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/medical_conditions.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/privacy_policy.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/terms_service.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/convert.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/models/k_models/profile_setting_data.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/profile_bottom_sheets/access_data_sheet.dart';
import 'package:focofit/widgets/k_bottom_sheets/profile_bottom_sheets/personal_data_sheets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../widgets/k_app_dialogs.dart';
import 'my_diet.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController aController = Get.put(AuthController());

    return GetBuilder(
        init: Get.put(ProfileController()),
        tag: 'profileController',
        builder: (c) {
          // c.currentDate.value =
          //     c.userData.value!.birthday.toString().substring(8, 10).toInt()!;
          // c.currentMonth.value =
          //     c.userData.value!.birthday.toString().substring(5, 7).toInt()!;
          // c.currentYear.value =
          //     c.userData.value!.birthday.toString().substring(0, 4).toInt()!;

          final profileSettingAccessList = [
            ProfileSettingData(
              title: AppStrings.email,
              subTitle: c.userData.value != null ? c.userData.value!.email : '',
              iconPath: AppIcons.emailIcon,
            ),
            ProfileSettingData(
              title: AppStrings.password,
              subTitle: '**************',
              iconPath: AppIcons.keyBoardIcon,
            ),
            ProfileSettingData(
              title: AppStrings.cellPhone,
              subTitle: '(16) 99999-9999',
              iconPath: AppIcons.phoneIcon,
            ),
          ].obs;
          // final profileSettingDataList = [
          //   ProfileSettingData(
          //     title: AppStrings.dateOfBirth,
          //     subTitle: c.userData.value!.birthday.toString().substring(0, 10),
          //     iconPath: AppIcons.cakeIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.gender,
          //     subTitle: c.userData.value!.gender,
          //     iconPath: AppIcons.genderIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.height,
          //     subTitle: '${c.userData.value!.height} cm',
          //     iconPath: AppIcons.heightIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.currentWeight,
          //     subTitle: '${c.userData.value!.currentWeight} kg',
          //     iconPath: AppIcons.weightIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.goalWeight,
          //     subTitle: '${c.userData.value!.goalWeight} kg',
          //     iconPath: AppIcons.goalWeightIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.activityLevel,
          //     subTitle: AppStrings.sedentary,
          //     iconPath: AppIcons.shoeIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.myDiet,
          //     subTitle: AppStrings.vegetarian,
          //     iconPath: AppIcons.saladIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.calorieGoal,
          //     subTitle: AppStrings.calorieGoalDescription,
          //     iconPath: AppIcons.chartIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.macronutrientGoal,
          //     subTitle: AppStrings.macronutrientGoalDescription,
          //     iconPath: AppIcons.chartIcon,
          //   ),
          //   ProfileSettingData(
          //     title: AppStrings.medicalConditions,
          //     subTitle: c.userData.value!.medicalConditions
          //         .toString()
          //         .substring(
          //             1,
          //             c.userData.value!.medicalConditions!.toString().length -
          //                 1),
          //     iconPath: AppIcons.medicalIcon,
          //   ),
          // ].obs;

          return Scaffold(
            backgroundColor: AppColor.whiteColor,
            appBar: kAppBar(
                onTap: () {
                  Navigator.pop(context);
                },
                title: AppStrings.setting,
                titleSize: 18),
            body: Obx(
              () => c.userData.value != null
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 130,
                            height: 140,
                            child: Stack(
                              children: [
                                Container(
                                  height: 130,
                                  width: 130,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1726037514~exp=1726041114~hmac='
                                              'df5d8c90eb262717d2a532974732ce0c847b84a167232fe9b051e093d9d3bc61&w=1380'))),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 0,
                                  child: showSvgIconWidget(
                                      iconPath: AppIcons.editIcon, height: 14),
                                )
                              ],
                            ),
                          ),
                          2.ySpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              KText(
                                  text: c.userData.value!.userName.toString(),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                              2.xSpace,
                              showSvgIconWidget(
                                  iconPath: AppIcons.editIcon,
                                  onTap: () {},
                                  height: 14),
                            ],
                          ),
                          KText(
                              text:
                                  '${Convert.calculateAge(c.userData.value!.birthday!)} ${AppStrings.years}',
                              fontWeight: FontWeight.w500),
                          4.ySpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              KText(
                                  text: AppStrings.weightLoss,
                                  fontWeight: FontWeight.w600),
                              2.xSpace,
                              showSvgIconWidget(
                                  iconPath: AppIcons.editIcon,
                                  onTap: () {},
                                  height: 14),
                            ],
                          ),
                          2.ySpace,
                          const StepProgressIndicator(
                            totalSteps: 10,
                            currentStep: 4,
                            selectedColor: AppColor.startGradient,
                            unselectedColor: AppColor.lightGreyColor,
                            roundedEdges: Radius.circular(35),
                            size: 8,
                            padding: 1,
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const KText(
                                text: '3,250  kg',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              KText(
                                text: AppStrings.of,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              const KText(
                                text: '12,400  kg',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ],
                          ),
                          5.ySpace,

                          /// Access Container
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: KText(
                                    text: AppStrings.accessData,
                                    fontWeight: FontWeight.w600),
                              )),
                          1.ySpace,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: AppColor.greyColor, width: 0.5)),
                            child: ListView.separated(
                              itemCount: profileSettingAccessList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Container(
                                  height: 1,
                                  color: AppColor.lightGreyBorder,
                                );
                              },
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: showSvgIconWidget(
                                    iconPath: profileSettingAccessList[index]
                                        .iconPath
                                        .toString(),
                                  ),
                                  title: KText(
                                      text: profileSettingAccessList[index]
                                          .title
                                          .toString(),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  subtitle: KText(
                                    text: profileSettingAccessList[index]
                                        .subTitle
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                  ),
                                  trailing: showSvgIconWidget(
                                      iconPath: AppIcons.editIcon,
                                      onTap: () {
                                        if (index == 0) {
                                          KBottomSheet.editEmail(context,
                                              onConfirmTap: () {
                                            Navigator.pop(context);
                                          });
                                        } else if (index == 1) {
                                          KBottomSheet.editPassword(context,
                                              onConfirmTap: () {
                                            Navigator.pop(context);
                                          });
                                        } else {
                                          KBottomSheet.editPhone(context,
                                              onConfirmTap: () {
                                            Navigator.pop(context);
                                          });
                                        }
                                      }),
                                  contentPadding: EdgeInsets.zero,
                                );
                              },
                            ),
                          ),

                          ///Personal Data Container
                          3.ySpace,
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: KText(
                                    text: AppStrings.personalData,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )),
                          1.ySpace,
                          Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: AppColor.greyColor, width: 0.5)),
                              child: ListTile(
                                leading: showSvgIconWidget(
                                    iconPath: AppIcons.cakeIcon),
                                title: KText(
                                    text: AppStrings.dateOfBirth,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                subtitle: Obx(
                                  () => KText(
                                      text: c.userData.value!.birthday
                                          .toString()
                                          .substring(0, 10),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),

                                trailing: showSvgIconWidget(
                                  iconPath: AppIcons.editIcon,
                                  onTap: () {
                                    KPersonalDataSheet.editDateBirth(
                                      context,
                                      profileController: c,
                                      authController: aController,
                                    );
                                  },
                                ),
                                // trailing: showSvgIconWidget(
                                //     onTap: () {
                                //       switch (index) {
                                //         case 0:
                                //           KPersonalDataSheet.editDateBirth(
                                //             context,
                                //             profileController: c,
                                //             authController: aController,
                                //           );
                                //           break;
                                //         case 1:
                                //           KPersonalDataSheet.editGender(context,
                                //               onConfirmTap: () {
                                //                 Get.back();
                                //               }, profileController: c);
                                //           break;
                                //         case 2:
                                //           KPersonalDataSheet.editHeight(context,
                                //               onConfirmTap: () {
                                //                 Get.back();
                                //               }, profileController: c);
                                //           break;
                                //         case 3:
                                //           KPersonalDataSheet.editCurrentWeight(
                                //               context, onConfirmTap: () {
                                //             Get.back();
                                //           }, profileController: c);
                                //           break;
                                //         case 4:
                                //           KPersonalDataSheet.editGoalWeight(context,
                                //               onConfirmTap: () {
                                //                 Get.back();
                                //               }, profileController: c);
                                //           break;
                                //         case 5:
                                //           KPersonalDataSheet.editActivityLevel(
                                //               context, onConfirmTap: () {
                                //             Get.back();
                                //           }, profileController: c);
                                //           break;
                                //         case 6:
                                //           Get.to(() => MyDiet());
                                //           break;
                                //         case 7:
                                //           Get.to(() => CalorieGoalScreen());
                                //           break;
                                //         case 8:
                                //           Get.to(() => MacroNutrients());
                                //           break;
                                //         case 9:
                                //           Get.to(() => MedicalConditions());
                                //           break;
                                //       }
                                //     },
                                //     iconPath: AppIcons.editIcon),
                                contentPadding: EdgeInsets.zero,
                              )
                              // ListView.separated(
                              //   itemCount: profileSettingDataList.length,
                              //   shrinkWrap: true,
                              //   padding: EdgeInsets.zero,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   separatorBuilder: (BuildContext context, int index) {
                              //     return Container(
                              //       height: 1,
                              //       color: AppColor.lightGreyBorder,
                              //     );
                              //   },
                              //   itemBuilder: (context, index) {
                              //     return ListTile(
                              //       leading: showSvgIconWidget(
                              //           iconPath: profileSettingDataList[index]
                              //               .iconPath
                              //               .toString()),
                              //       title: KText(
                              //           text: profileSettingDataList[index]
                              //               .title
                              //               .toString(),
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w500),
                              //       subtitle: KText(
                              //           text: profileSettingDataList[index]
                              //               .subTitle
                              //               .toString(),
                              //           maxLines: 1,
                              //           overflow: TextOverflow.ellipsis,
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w400),
                              //       trailing: showSvgIconWidget(
                              //           onTap: () {
                              //             switch (index) {
                              //               case 0:
                              //                 KPersonalDataSheet.editDateBirth(
                              //                   context,
                              //                   profileController: c,
                              //                   authController: aController,
                              //                 );
                              //                 break;
                              //               case 1:
                              //                 KPersonalDataSheet.editGender(context,
                              //                     onConfirmTap: () {
                              //                   Get.back();
                              //                 }, profileController: c);
                              //                 break;
                              //               case 2:
                              //                 KPersonalDataSheet.editHeight(context,
                              //                     onConfirmTap: () {
                              //                   Get.back();
                              //                 }, profileController: c);
                              //                 break;
                              //               case 3:
                              //                 KPersonalDataSheet.editCurrentWeight(
                              //                     context, onConfirmTap: () {
                              //                   Get.back();
                              //                 }, profileController: c);
                              //                 break;
                              //               case 4:
                              //                 KPersonalDataSheet.editGoalWeight(context,
                              //                     onConfirmTap: () {
                              //                   Get.back();
                              //                 }, profileController: c);
                              //                 break;
                              //               case 5:
                              //                 KPersonalDataSheet.editActivityLevel(
                              //                     context, onConfirmTap: () {
                              //                   Get.back();
                              //                 }, profileController: c);
                              //                 break;
                              //               case 6:
                              //                 Get.to(() => MyDiet());
                              //                 break;
                              //               case 7:
                              //                 Get.to(() => CalorieGoalScreen());
                              //                 break;
                              //               case 8:
                              //                 Get.to(() => MacroNutrients());
                              //                 break;
                              //               case 9:
                              //                 Get.to(() => MedicalConditions());
                              //                 break;
                              //             }
                              //           },
                              //           iconPath: AppIcons.editIcon),
                              //       contentPadding: EdgeInsets.zero,
                              //     );
                              //   },
                              // ),
                              ),
                          3.ySpace,

                          /// On Container
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: KText(
                                    text: AppStrings.on,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )),
                          1.ySpace,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: AppColor.greyColor, width: 0.5)),
                            child: ListView.separated(
                                itemCount: profileSettingOnList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Container(
                                    height: 1,
                                    color: AppColor.lightGreyBorder,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      switch (index) {
                                        case 0:
                                          Get.to(() => const PrivacyPolicy());
                                          break;
                                        case 1:
                                          Get.to(() => ChangeAppLanguage());
                                          break;
                                        case 3:
                                          Get.to(() => const TermsAndService());
                                          break;
                                      }
                                    },
                                    leading: showSvgIconWidget(
                                        iconPath: profileSettingOnList[index]
                                            .iconPath
                                            .toString(),
                                        color: AppColor.greyColor),
                                    title: KText(
                                        text: profileSettingOnList[index]
                                            .title
                                            .toString(),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    trailing: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.greyColor,
                                      size: 15,
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                  );
                                }),
                          ),
                          5.ySpace,
                          kTextButton(
                              onPressed: () async {
                                await c.logout();
                              },
                              btnText: AppStrings.logOutOfAccount,
                              useGradient: true),
                          3.ySpace,
                        ],
                      ),
                    )
                  : const Center(child: ProgressIndicatorCustom()),
            ),
          );
        });
  }
}
