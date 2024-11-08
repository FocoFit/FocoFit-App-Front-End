import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/widgets/k_bottom_sheets/fasting_bottom_sheets.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SeeFasting extends StatelessWidget {
  const SeeFasting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: AppStrings.intermittentFasting,
        titleSize: 18
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.lightGreyBorder),
                boxShadow: const [
                  AppColor.shadow
                ]
              ),
              child: Column(children: [
                CircularPercentIndicator(
                  animationDuration: 1000,
                  linearGradient: AppColor.primaryGradient,
                  backgroundColor: AppColor.lightGreyColor,
                  animation: true,
                  restartAnimation: true,
                  rotateLinearGradient: true,
                  fillColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                  widgetIndicator: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.circle,color: Colors.white,size: 12,)),
                  radius: 16.h,
                  lineWidth: 23,
                  backgroundWidth: 23,
                  percent: 0.4,
                  curve: Curves.easeIn,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KText(text:  AppStrings.elapsedTime,fontSize: 16,color: AppColor.greyColor,),
                      Text('00:00:25', style: kTextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                      2.ySpace,
                      KText(text:  AppStrings.timeExceeded, fontSize: 16,color: AppColor.greyColor,),
                      Text('00:00:25', style: kTextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                3.ySpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    children: [
                      KText(text:  AppStrings.startAt, fontSize: 16,color: AppColor.greyColor,fontWeight: FontWeight.w500),
                      GradientText(text: '22 : 00', gradient: AppColor.primaryGradient,style: kTextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      KText(text:  '${AppStrings.todayAt} (17/08)',fontWeight: FontWeight.w500,fontSize: 14, color: AppColor.greyColor,),
                    ],
                  ),
                  Container(
                    height: 6.h,
                    width: 1,
                    color: AppColor.lightGreyBorder,
                  ),
                  Column(
                    children: [
                      KText(text:  AppStrings.endsAt, fontSize: 16,color: AppColor.greyColor,fontWeight: FontWeight.w500),
                      GradientText(text: '22 : 00', gradient: AppColor.primaryGradient,style: kTextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      KText(text:  '${AppStrings.tomorrow} (17/08)',fontWeight: FontWeight.w500,fontSize: 14,color: AppColor.greyColor,),
                    ],
                  ),
                ],)
              ],),
            ),
            3.ySpace,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.lightGreyBorder),
                  boxShadow: const [
                    AppColor.shadow
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      KText(text: '${AppStrings.currentFastingPlan}:',fontSize: 15,fontWeight: FontWeight.w400,),
                      const KText(text: ' (17/08)',fontSize: 15,fontWeight: FontWeight.w500,),
                    ],
                  ),
                  GradientText(
                    onTextTap: (){
                      Navigator.pop(context);
                    },
                    text: AppStrings.alter,
                    gradient: AppColor.primaryGradient,
                    style: kTextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                ],),
            ),

          ],
        ),
      ),

      bottomNavigationBar: kTextButton(
          onPressed: (){
            KFastBottomSheet.breakFastSheet(context,
                onConfirmTap: (){
              Get.back();
              Get.back();},
                onCancelTap: (){
                  Get.back();
                  Get.back();
                }
            );
          },
          useGradient: true,
          btnText: AppStrings.startFasting,
          fontSize: 16
      ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
    );
  }
}
