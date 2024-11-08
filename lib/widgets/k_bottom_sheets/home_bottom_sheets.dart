import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/search_recipe_manually.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/recipe_widgets/k_circular_progress_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KHomeBottomSheet {
  // Common method to show the bottom sheet
  static void show({
    required BuildContext context,
    required String title,
    String? btnText,
    required List<Widget> content,
    Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 2),
          height: context.isKeyboardVisible ? mQ.height : mQ.height * heightFactor,
          width: mQ.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.isKeyboardVisible ? 30.height : 2.height,
              _buildHeader(),
              3.ySpace,
              _buildTitle(title),
              10.height,
              ...content,
              const Spacer(),
              onConfirmTap != null
                  ? _buildConfirmButton(onConfirmTap,btnText)
                  : const SizedBox.shrink(),
              3.ySpace,
            ],
          ).paddingSymmetric(horizontal: 4.w),
        );
      },
    );
  }



  static void quickRegistration(BuildContext context, {required Function() onExerciseTap, required Function() onSnackTap}) {
    show(
      context: context,
      title: AppStrings.quickRegistration,
      content: [
        10.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onExerciseTap,
              child: Container(
                height: 17.h,
                width: 29.w,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyBorder),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(AppImages.dumbellImg,height: 90,width: 110,),
                    KText(text:  AppStrings.exercise,fontSize: 18,)
                  ],
                ),
              ),
            ),
            5.xSpace,
            GestureDetector(
              onTap: onSnackTap,
              child: Container(
                height: 17.h,
                width: 29.w,
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyBorder),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.choclateImg,height: 70,width: 110,),
                    2.height,
                    KText(text:  AppStrings.snack,fontSize: 18,)
                  ],
                ),
              ),
            ),
          ],
        )
      ],
      heightFactor: 0.35,
    );
  }
//
  static void exerciseRegisterSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.quickExerciseLog,
      content: [
        const Divider(color: AppColor.lightGreyBorder,),
        2.ySpace,
        KText(text: AppStrings.activityName,),
        1.ySpace,
        CustomTextField(context: context,
          hintText: AppStrings.exRace,textInputType: TextInputType.text,borderColor: AppColor.greyColor,color: AppColor.whiteColor,),
        1.ySpace,
        KText(text:  AppStrings.calories),
        1.ySpace,
        CustomTextField(context: context,
          prefixText: AppStrings.calories,
          suffixText: AppStrings.kcal,
          hintText: '0',
          textDirection: TextDirection.ltr,borderColor: AppColor.greyColor,color: AppColor.whiteColor,),
        1.ySpace,
        KText(text:  AppStrings.duration),
        1.ySpace,
        CustomTextField(context: context,
          prefixText: AppStrings.duration,
          suffixText: AppStrings.min,
          hintText: '0',
          textDirection: TextDirection.ltr,
          textInputAction: TextInputAction.done,borderColor: AppColor.greyColor,color: AppColor.whiteColor,),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.58,
    );
  }

  static void snackRegisterSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.quickMealLog,
      content: [
        const Divider(color: AppColor.lightGreyBorder,),
        2.ySpace,
        KText(text: AppStrings.foodName,fontWeight: FontWeight.w500),
        1.ySpace,
        CustomTextField(context: context,hintText: AppStrings.carrotCake,textInputType: TextInputType.text,borderColor: AppColor.greyColor,color: AppColor.whiteColor,),
        1.ySpace,
        KText(text: AppStrings.calories,fontWeight: FontWeight.w500),
        1.ySpace,
        CustomTextField(context: context,
          prefixText: AppStrings.calories,
          suffixText: AppStrings.kcal,
          hintText: '0',
          textDirection: TextDirection.ltr,borderColor: AppColor.greyColor,color: AppColor.whiteColor,),
        1.ySpace,
        KText(text: AppStrings.carbohydrateOptional,fontWeight: FontWeight.w500),
        1.ySpace,
        CustomTextField(context: context,
          prefixText: AppStrings.carbohydrates,
          suffixText: AppStrings.grams,
          hintText: '0',
          textDirection: TextDirection.ltr,borderColor: AppColor.greyColor,color: AppColor.whiteColor,),
        1.ySpace,
        KText(text: AppStrings.proteinsOptional,fontWeight: FontWeight.w500),
        1.ySpace,
        CustomTextField(context: context,
          prefixText: AppStrings.proteins,
          suffixText: AppStrings.grams,
          hintText: '0',
          textDirection: TextDirection.ltr,borderColor: AppColor.greyColor,color: AppColor.whiteColor,),
        1.ySpace,
        KText(text: AppStrings.fatOptional,fontWeight: FontWeight.w500),
        1.ySpace,
        CustomTextField(context: context,
          prefixText: AppStrings.fats,
          suffixText: AppStrings.grams,
          textDirection: TextDirection.ltr,
          hintText: '0',
          textInputAction: TextInputAction.done, borderColor: AppColor.greyColor,color: AppColor.whiteColor,),
      ],
      onConfirmTap: onConfirmTap!,
      heightFactor: 0.8,
    );
  }

  static void confirmationSheet(BuildContext context, {Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.quickMealLog,
      content: [
        const Divider(color: AppColor.lightGreyBorder,),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
              height: 20.h,
              width: 20.h,
              child: const Image(image: AssetImage(AppImages.greenCheckImg))),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(AppStrings.exerciseRegistered,
            style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
        ),
      ],
      btnText: AppStrings.confirm,
      onConfirmTap: onConfirmTap!,
      heightFactor: 0.5,
    );
  }

  static void recordMeal(BuildContext context) {
    show(
      context: context,
      title: AppStrings.recordMeal,
      content: [
        3.ySpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  Get.to(()=>const SearchRecipeManually());
                },
                child: Container(
                  height: 16.h,
                  // padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.greyColor,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const  Image(
                        image: AssetImage(AppImages.blueSearchImg),
                        height: 70,
                        width: 70,
                      ),
                      KText( text: AppStrings.searchManually,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            5.xSpace,
            Expanded(
              flex: 1,
              child: Container(
                height: 16.h,
                padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.greyColor,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(AppImages.blueCameraImg),
                      height: 70,
                      width: 70,
                    ),
                    KText( text: AppStrings.identifyWithAI,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
            ),
            5.xSpace,
            Expanded(
              flex: 1,
              child: Container(
                height: 16.h,
                padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.greyColor,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const  Image(
                      image: AssetImage(AppImages.blueBarcodeImg),
                      height: 70,
                      width: 70,
                    ),
                    KText( text: AppStrings.barcode,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ],
      heightFactor: 0.35,
    );
  }

  static void addCalories(BuildContext context) {
    show(
      context: context,
      title: AppStrings.registerBreakFast,
      content: [
        const Divider(color: AppColor.lightGreyBorder,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.sweetRice,style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            2.xSpace,
            showSvgIconWidget(iconPath: AppIcons.editIcon)
          ],
        ),
        10.height,
        Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
              children: [
            TextSpan(text: '0', style: primaryTextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
            TextSpan(text: ' Kcal', style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
          ])),
        ),
        3.ySpace,
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          KCircularProgressBar(consumed: '0', dietName: AppStrings.carbohydrates, lineGradient: AppColor.greenGradient, progressValue: 0.2),
          KCircularProgressBar(consumed: '0', dietName: AppStrings.proteins, lineGradient: AppColor.redGradient, progressValue: 0.2),
          KCircularProgressBar(consumed: '0', dietName: AppStrings.fats, lineGradient: AppColor.primaryGradient, progressValue: 0.2),
        ],),
        3.ySpace,
        CustomTextField(
          context: context,
          prefixText: '${AppStrings.amount}:',
          suffixText: AppStrings.grams,
          color: AppColor.whiteColor,borderColor: AppColor.lightGreyBorder,
          textDirection: TextDirection.ltr,
          textInputAction: TextInputAction.done,
        ),
      ],
      onConfirmTap: (){Get.back();},
      btnText: AppStrings.toAdd,
      heightFactor: 0.58,
    );
  }

  static void addPhysicalActivity(BuildContext context) {
    show(
      context: context,
      title: AppStrings.recordPhysicalActivity,
      content: [
        const Divider(color: AppColor.lightGreyBorder,),
        Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(text: '0 ', style: kTextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                    TextSpan(text: AppStrings.kcal, style: kTextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
                  ])),
        ),
        const Spacer(),
        CustomTextField(
          context: context,
          controller: TextEditingController(),
          prefixText: '${AppStrings.duration}:',
          suffixText: AppStrings.min,
          textDirection: TextDirection.ltr,
          textInputAction: TextInputAction.done,
        ),
      ],
      btnText: AppStrings.toAdd,
      onConfirmTap: (){},
      heightFactor: 0.4,
    );
  }

  static void goalWeight(BuildContext context, {Function()? onConfirmTap,required HomeController homeController}) {
    show(
      context: context,
      title: '${AppStrings.register} ${AppStrings.currentWeight}',
      content: [
        const Divider(color: AppColor.lightGreyBorder,),
        3.ySpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: homeController.kgController,
                onSelectedItemChanged: (value) {
                  homeController.selectedWeightKg.value = value;
                },
                itemExtent: 55,
                perspective: 0.004,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 120,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == homeController.selectedWeightKg.value
                          ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: primaryTextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                      ),)
                          : Text(
                        index.toString(),
                        style:  primaryTextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                    );
                  },
                ),
              ),
            ),
            Text(
              'Kg',
              textAlign: TextAlign.end,
              style: primaryTextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: homeController.grController,
                onSelectedItemChanged: (value) {
                  homeController.selectedWeightGr.value = value;
                },
                itemExtent: 55,
                perspective: 0.004,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 1000,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == homeController.selectedWeightGr.value
                          ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: primaryTextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                      ),)
                          : Text(
                        index.toString(),
                        style:  primaryTextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                    );
                  },
                ),
              ),
            ),
            Text(
              'Gr',
              textAlign: TextAlign.end,
              style: primaryTextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black,),
            ),
          ],
        ),
        3.ySpace,
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.52,
    );
  }

  static void recordWaterConsumption(BuildContext context, {Function()? onConfirmTap,required HomeController homeController}) {
    show(
      context: context,
      title: AppStrings.recordWaterConsumption,
      content: [
        const Divider(color: AppColor.lightGreyBorder,),
        3.ySpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.2,
              child: ListWheelScrollView.useDelegate(
                controller: homeController.waterController,
                onSelectedItemChanged: (value) {
                  homeController.selectedWater.value = value;
                },
                itemExtent: 55,
                perspective: 0.004,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 120,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == homeController.selectedWater.value
                          ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: primaryTextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                      ),)
                          : Text(
                        index.toString(),
                        style:  primaryTextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                    );
                  },
                ),
              ),
            ),
           const  KText(
              text: ',',
             fontSize: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: homeController.waterLiterController,
                onSelectedItemChanged: (value) {
                  homeController.selectedWaterLiter.value = value;
                },
                itemExtent: 55,
                perspective: 0.004,
                diameterRatio: 1.6,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 1000,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == homeController.selectedWaterLiter.value
                          ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: primaryTextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                      ),)
                          : Text(
                        index.toString(),
                        style:  primaryTextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                    );
                  },
                ),
              ),
            ),
            Text(
              AppStrings.liter,
              textAlign: TextAlign.end,
              style: primaryTextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.black,),
            ),
            10.height,
          ],
        ),
        3.ySpace,
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.52,
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
      child: KText(
        text: title,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
      ),
    );
  }



  static Widget _buildConfirmButton(Function()? onConfirmTap,String? btnText) {
    return kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap!,
      btnText: btnText?? AppStrings.save,
      useGradient: true,
      fontSize: 17,
        height: 7,
    );
  }
}
