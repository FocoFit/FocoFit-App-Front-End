import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KRecipeBottomSheets {
  static void show({
    required BuildContext context,
    String? title,
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
      isDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.5),
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return Container(
          height: mQ.height * heightFactor,
          width: mQ.width,
          padding: const EdgeInsets.only(top: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              3.ySpace,
              _buildTitle(title!),
              10.height,
              ...content,
              const Spacer(),
              _buildConfirmButton(onConfirmTap),
              3.ySpace,
            ],
          ).paddingSymmetric(horizontal: 4.w),
        );
      },
    );
  }

  static void filter(BuildContext context, {
    required Function() onConfirmTap,
    required RecipeController recipeController,
    required List<String> dietList,
  }) {

    show(
      context: context,
      title: '${AppStrings.filterBy}:',
      content: [
        KText(text: AppStrings.calories, fontWeight: FontWeight.w600,fontSize: 18,
        ),
        1.ySpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(text: '0 ${AppStrings.kcal}',fontSize: 14,fontWeight: FontWeight.w500),
            Obx(() => KText(
                text: '${recipeController.currentCalories.value.toInt()} ${AppStrings.kcal}',
             fontSize: 14,fontWeight: FontWeight.w500,
            )),
          ],
        ),
        1.ySpace,
        Obx(() => SliderTheme(
          data: SliderTheme.of(context).copyWith(

            overlayColor: Colors.transparent,
            minThumbSeparation: 100,
            thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 10.0,
                disabledThumbRadius: 10.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
          ),
          child: Slider(
            value: recipeController.currentCalories.value,
            min: 0,
            max: 700,
            activeColor: Colors.orange,
            inactiveColor: AppColor.lightGreyColor,
            onChanged: (double value) {
              recipeController.currentCalories.value = value.roundToDouble();
            },
          ),
        )),
        3.ySpace,
        KText(text:AppStrings.snack,fontWeight: FontWeight.w600,fontSize: 18,
        ),
        1.ySpace,
        SizedBox(
          height: 4.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Obx(() => GestureDetector(
                onTap: () {
                  if (recipeController.selectedSnacks.contains(index)) {
                    recipeController.selectedSnacks.remove(index);
                  } else {
                    recipeController.selectedSnacks.add(index);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: recipeController.selectedSnacks.contains(index)
                          ? AppColor.startGradient
                          : AppColor.greyColor,
                      width: recipeController.selectedSnacks.contains(index) ? 1.5 : 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: KText(
                    text: AppStrings.lunch,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ));
            },
          ),
        ),

        3.ySpace,
        KText(text: AppStrings.diets,fontWeight: FontWeight.w600,fontSize: 18,
        ),
        1.ySpace,
        Wrap(
          spacing: 6.0,
          children: List<Widget>.generate(dietList.length, (int index) {
            return Obx(()=>GestureDetector(
                onTap: (){
                  if(recipeController.selectedDiets.contains(index)){
                    recipeController.selectedDiets.remove(index);
                  }else{
                    recipeController.selectedDiets.add(index);
                  }
                },
                child: Chip(
                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side:  BorderSide(
                      color: recipeController.selectedDiets.contains(index)
                          ? AppColor.startGradient
                          : AppColor.greyColor,
                      width: 1,
                    ),
                  ),
                  backgroundColor: AppColor.whiteColor,
                  label: KText(text: dietList[index].toString(),fontWeight: FontWeight.w500,),
                ),
              ),
            );
          }),
        ),
        3.ySpace,
        KText(text: AppStrings.difficultyInPreparation,fontWeight: FontWeight.w600,fontSize: 18,
        ),
        1.ySpace,
        SizedBox(
          height: 4.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context,index){
                return Obx(()=>GestureDetector(
                  onTap: (){
                    if(recipeController.selectedDifficulty.contains(index)) {
                      recipeController.selectedDifficulty.remove(index);
                    }else{
                      recipeController.selectedDifficulty.add(index);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: recipeController.selectedDifficulty.contains(index)
                            ? AppColor.startGradient
                            : AppColor.lightGreyBorder,
                            width: recipeController.selectedDifficulty.contains(index)
                                ? 1.5
                                : 1
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: KText(text:  AppStrings.lunch,fontWeight: FontWeight.w500,),
                  ),
                ),
                );
              }),
        ),
        3.ySpace,
        KText(text:
          AppStrings.preparationTime,fontWeight: FontWeight.w600,fontSize: 18,
        ),
        2.ySpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(text:  '5 ${AppStrings.min}',fontSize: 14,fontWeight: FontWeight.w500,),
            Obx(() => KText(text: '${recipeController.currentTime.value.toInt()} ${AppStrings.min}+',
              fontSize: 14,fontWeight: FontWeight.w500,
            )),
          ],
        ),
        1.ySpace,
        Obx(() => SliderTheme(
          data: SliderTheme.of(context).copyWith(
            overlayColor: Colors.transparent,
            minThumbSeparation: 100,
            thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 10.0,
                disabledThumbRadius: 10.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
          ),
          child: Slider(
            value: recipeController.currentTime.value,
            min: 0,
            max: 90,
            activeColor: Colors.orange,
            inactiveColor: AppColor.lightGreyColor,
            onChanged: (double value) {
              recipeController.currentTime.value = value.roundToDouble();
            },
          ),
        ),
        ),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.9,
    );
  }


  static void addQuantityType(BuildContext context, {Function()? onConfirmTap, required RecipeController c}) {
    RxInt tempSelectedIndex = 0.obs;

    show(
      context: context,
      title: AppStrings.selectTheMeasurement,
      content: [
        const Divider(color: AppColor.lightGreyBorder,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListWheelScrollView.useDelegate(
                controller: c.quantityController,
                onSelectedItemChanged: (value) {
                  tempSelectedIndex.value = value;
                },
                itemExtent: 30,
                perspective: 0.006,
                diameterRatio: 1.9,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: c.quantityTypeList.length,
                  builder: (context, index) {
                    return Obx(()=>Center(
                      child: index == tempSelectedIndex.value
                          ? GradientText(
                        text: c.quantityTypeList[index],
                        gradient: AppColor.primaryGradient,
                        style: kTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                          : KText(text:
                        c.quantityTypeList[index],
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7),
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
      onConfirmTap: () {
        FocusScope.of(context).unfocus();
        c.selectedQuantityType.value = c.quantityTypeList[tempSelectedIndex.value];
        print('Selected Quantity Type: ${c.selectedQuantityType.value}');

        Navigator.pop(context);
        if (onConfirmTap != null) {
          onConfirmTap();
        }
      },
      heightFactor: 0.45,
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
      onPressed: onConfirmTap,
      btnText: AppStrings.toLookFor,
      useGradient: true,
      height: 7
    );
  }
}
