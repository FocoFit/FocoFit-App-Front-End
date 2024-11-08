import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/fast_ui/fasting_screen.dart';
import 'package:focofit/screens/home_ui/home_screen.dart';
import 'package:focofit/screens/profile_ui/profile_screen.dart';
import 'package:focofit/screens/receipe_ui/receipe_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';


class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({super.key});
  final List<Widget> _pages = [
    HomeScreen(),
    FastingScreen(),
    RecipeScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      body: _pages[BottomBarIndex.currentIndex.value],
      bottomNavigationBar: Container(
        height: 80,
        width: mQ.width,
        decoration: const BoxDecoration(
            color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.lightGreyColor,
              spreadRadius: 5,
              blurRadius: 5
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            return InkWell(
              onTap: () {
                BottomBarIndex.currentIndex.value = index;
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    showSvgIconWidget(
                      onTap: (){
                        BottomBarIndex.currentIndex.value = index;
                      },
                      height:20,
                      iconPath: index== BottomBarIndex.currentIndex.value
                          ? filledIcons[index]
                          : listOfIcons[index],
                    ),
                    5.height,
                    GradientText(text: listOfTitles[index], gradient: index==BottomBarIndex.currentIndex.value?AppColor.primaryGradient:AppColor.blackGradient,
                    style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    ) );
  }
  final List filledIcons= [
    AppIcons.filledHomeIcon,
    AppIcons.filledAlarmIcn,
    AppIcons.filledRecipeIcn,
    AppIcons.filledProfileIcon,
  ];
  final  List listOfIcons = [
  AppIcons.homeIcn,
  AppIcons.alarmIcn,
  AppIcons.recipeIcn,
  AppIcons.profileIcn,
  ];
  static List listOfTitles = [
    AppStrings.daily,
    AppStrings.fast,
    AppStrings.recipes,
    AppStrings.profile,
  ];
}
class BottomBarIndex{
  static final  RxInt currentIndex = 0.obs;
}

