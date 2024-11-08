import 'dart:math';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_subscribe_container.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/all_physical_activity.dart';
import 'package:focofit/screens/home_ui/subscribed_screen.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/enums.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_bottom_sheets/home_bottom_sheets.dart';
import 'package:focofit/screens/profile_ui/notification_screen.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/profile_setting.dart';
import 'package:focofit/models/k_models/home_data.dart';
import 'package:focofit/widgets/home_widgets/expansion_tile.dart';
import 'package:focofit/widgets/home_widgets/k_calories_container.dart';
import 'package:get/get.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ProfileController pController = Get.put(ProfileController());
    return GetBuilder(
        init: Get.put(HomeController()),
        tag: 'homeController',
        builder: (c) {
          return Obx(
            () => Scaffold(
              appBar: kProfileAppBar(
                onTileTap: () => Get.to(() => const ProfileSetting()),
                trailingOnTap: () {
                  Get.to(() => const NotificationScreen());
                },
                imgPath:
                    'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1726037514~exp=1726041114~hmac='
                    'df5d8c90eb262717d2a532974732ce0c847b84a167232fe9b051e093d9d3bc61&w=1380',
                title: 'Boa tarde,',
                subTitle: pController.userData.value != null
                    ? pController.userData.value!.userName
                    : '',
                notificationCount: '9',
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SubScribedContainer(
                        onTap: () => Get.to(
                              () => const SubscribedScreen(),
                            ),
                        title: AppStrings.becomeProSubscriber,
                        subTitle: AppStrings.subscribeBenefit),
                    2.ySpace,
                    SizedBox(
                      height: 100, // Adjust height as needed
                      child: Obx(() {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: c.daysInMonth.length,
                          itemBuilder: (context, index) {
                            final day = c.daysInMonth[index];
                            final dayOfWeek = DateFormat('E').format(DateTime(
                              c.currentDate.value.year,
                              c.currentDate.value.month,
                              day,
                            ));
                            return GestureDetector(
                              onTap: () {
                                c.selectedDay.value = day;
                                print('Selected day: ${c.selectedDay.value}');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dayOfWeek,
                                    style: kTextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Obx(() => Container(
                                        width: 40,
                                        // Adjust width as needed
                                        height: 40,
                                        // Adjust height as needed
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: day == c.selectedDay.value
                                              ? AppColor.primaryGradient
                                              : null,
                                        ),
                                        child: Text(
                                          day.toString(),
                                          style: kTextStyle(
                                            color: day == c.selectedDay.value
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                    1.ySpace,
                    CaloriesContainer(
                      title: AppStrings.dailyGoal,
                      totalCalories: '1252',
                      consumedTitle: AppStrings.consumed,
                      consumed: '1252',
                      burnTitle: AppStrings.burns,
                      burned: '1252',
                      calories: AppStrings.caloriesRemaining,
                      progress: 0.4,
                      carbohydrate: '400 / 1000',
                      carbPercent: 0.6,
                      protein: '400 / 1000',
                      proteinPercent: 0.7,
                      fat: '200 / 1000',
                      fatPercent: 0.4,
                    ),
                    5.ySpace,
                    kTextButton(
                      onPressed: () {
                        KHomeBottomSheet.quickRegistration(context,
                            onExerciseTap: () {
                          Navigator.pop(context);
                          KHomeBottomSheet.exerciseRegisterSheet(context,
                              onConfirmTap: () {
                            Navigator.pop(context);
                            KHomeBottomSheet.confirmationSheet(context,
                                onConfirmTap: () {
                              Navigator.pop(context);
                            });
                          });
                        }, onSnackTap: () {
                          Navigator.pop(context);
                          KHomeBottomSheet.snackRegisterSheet(context,
                              onConfirmTap: () {
                            Navigator.pop(context);
                            KHomeBottomSheet.confirmationSheet(context,
                                onConfirmTap: () {
                              Navigator.pop(context);
                            });
                          });
                        });
                      },
                      btnText: AppStrings.quickCalorieLog,
                      useGradient: true,
                    ),
                    5.ySpace,
                    ListView.builder(
                      itemCount: homeDataList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final randomColor =
                            Color((Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(1.0);
                        if (index == homeDataList.length - 2) {
                          return KHomeListTile(
                            title: homeDataList[index].title,
                            subtitle: 'Meta: 0 / 7,0 l',
                            imageUrl: homeDataList[index].iconPath,
                            borderColor: randomColor,
                            subImageUrl: AppImages.waterDropImg,
                            onPressed: () {
                              KHomeBottomSheet.recordWaterConsumption(context,
                                  homeController: HomeController(),
                                  onConfirmTap: () {
                                Navigator.pop(context);
                              });
                            },
                          );
                        } else if (index == homeDataList.length - 1) {
                          return KHomeListTile(
                            title: homeDataList[index].title,
                            subtitle: 'Meta: 65,5 / 60,5 kg',
                            imageUrl: homeDataList[index].iconPath,
                            borderColor: randomColor,
                            onPressed: () {
                              KHomeBottomSheet.goalWeight(context,
                                  homeController: HomeController(),
                                  onConfirmTap: () {
                                Navigator.pop(context);
                              });
                            },
                          );
                        } else {
                          return CustomExpandableContainer(
                            title: homeDataList[index].title,
                            subtitle: 'Meta diária: 100/1000 kcal',
                            imageUrl: homeDataList[index].iconPath,
                            borderColor: randomColor,
                            childrenData: const [
                              {
                                'name': 'Cafe sem acucar,100ml ',
                                'calories': ' 56 kcal'
                              },
                              {
                                'name': 'Cafe com leite, 200ml ',
                                'calories': ' 120 kcal'
                              },
                              {
                                'name': 'Pão integral, 50g ',
                                'calories': ' 150 kcal'
                              },
                            ],
                            onTapTrailing: () {
                              switch (homeDataList[index].type) {
                                case HomeItemType.breakFast:
                                  KHomeBottomSheet.recordMeal(context);
                                  break;
                                case HomeItemType.lunch:
                                  KHomeBottomSheet.recordMeal(context);
                                  break;
                                case HomeItemType.toHaveLunch:
                                  KHomeBottomSheet.recordMeal(context);
                                  break;
                                case HomeItemType.snacks:
                                  KHomeBottomSheet.recordMeal(context);
                                  break;
                                case HomeItemType.physicalActivity:
                                  Get.to(() => const AllPhysicalActivity());
                                  break;
                                default:
                                  print(
                                      'No matching action for ${homeDataList[index].title}');
                              }
                            },
                            onEditPressed: () {
                              print('Editor historico tapped');
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
