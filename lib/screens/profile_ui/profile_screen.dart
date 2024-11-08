import 'package:flutter/material.dart';
import 'package:focofit/components/k_subscribe_container.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/subscribed_screen.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/activity_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/aqua_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/fasting_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/feeding_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/icm_history_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/calories_chart.dart';
import 'package:focofit/screens/profile_ui/k_bar_charts/neutrients_charts.dart';
import 'package:focofit/screens/profile_ui/profile_setting_ui/profile_setting.dart';
import 'package:focofit/screens/profile_ui/weight_history_screen.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(ChartsController()),
      builder: (c) {
        return Scaffold(
          appBar: kProfileAppBar(
            onTileTap: () {},
            trailingOnTap: () {
              Get.to(()=> const ProfileSetting());
            },
            imgPath: 'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1726037514~exp=1726041114~hmac='
                'df5d8c90eb262717d2a532974732ce0c847b84a167232fe9b051e093d9d3bc61&w=1380',
            title: 'Boa tarde,',
            subTitle: 'Weslei Vicentini',
          ),
          body:SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 4.w,vertical:  2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SubScribedContainer(
                  onTap: ()=>Get.to(()=> const SubscribedScreen(),),
                  title: AppStrings.becomeProSubscriber,
                  subTitle: AppStrings.subscribeBenefit,
              ),
                3.ySpace,
              KText(text:  AppStrings.countryHistory,fontSize: 18,fontWeight: FontWeight.w700,),
                2.ySpace,
                CaloriesGraphScreen(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> const WeightHistoryScreen());
                  },
                  btnText: AppStrings.historicalEditor,
                ),
                3.ySpace,
                KText(text:  AppStrings.icmHistory,fontSize: 18,fontWeight: FontWeight.w700,),
                2.ySpace,
                IcmHistoryChart(
                  controller: c,
                  onButtonTap: (){},
                  btnText: AppStrings.historicalEditor,
                ),
                3.ySpace,
                KText(text:  AppStrings.waterHistory,fontSize: 18,fontWeight: FontWeight.w700,),
                2.ySpace,
                AquaChart(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> const WeightHistoryScreen());
                  },
                  btnText: AppStrings.historicalEditor,
                ),
                3.ySpace,
                KText(text:  AppStrings.activityHistory,fontSize: 18,fontWeight: FontWeight.w700,),
                2.ySpace,
                ActivityChart(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> const WeightHistoryScreen());
                  },
                  btnText: AppStrings.historicalEditor,
                ),
                3.ySpace,
                KText(text:  AppStrings.foodHistory,fontSize: 18,fontWeight: FontWeight.w700,),
                2.ySpace,
                FeedingChart(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> const WeightHistoryScreen());
                  },
                  btnText: AppStrings.historicalEditor,
                ),
                3.ySpace,
                KText(text:  AppStrings.macronutrientHistory,fontSize: 18,fontWeight: FontWeight.w700,),
                2.ySpace,
                NutrientsCharts(
                  controller: c,
                ),
                3.ySpace,
                KText(text:  AppStrings.fastingHistory,fontSize: 18,fontWeight: FontWeight.w700,),
                2.ySpace,
                FastingChart(
                  controller: c,
                  onButtonTap: (){
                    Get.to(()=> const WeightHistoryScreen());
                  },
                  btnText: AppStrings.fastingHistory,
                ),
            ],
            ),
          ),
        );
      }
    );
  }
}