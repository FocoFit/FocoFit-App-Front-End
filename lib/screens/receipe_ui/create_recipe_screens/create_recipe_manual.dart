import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/recipe_added.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/recipe_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateRecipeManual extends StatelessWidget {
  CreateRecipeManual({super.key});
  final RecipeController controller= Get.find(tag: 'recipeController');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: AppStrings.createRecipe,
        onTap: (){
          Navigator.pop(context);
        },
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KText(text: AppStrings.recipeName,fontSize: 16,fontWeight: FontWeight.w500),
            10.height,
            CustomTextField(
              context: context,
              controller: controller.recipeNameC,
              hintText: AppStrings.sugarFreeCake,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              color: AppColor.whiteColor,
              borderColor: AppColor.greyColor,
            ),
            20.height,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KText(text: AppStrings.ingredients,fontSize: 16,fontWeight: FontWeight.w500),
                    KText(text: AppStrings.amount,fontSize: 16,fontWeight: FontWeight.w500),
                  ],
                ),
                1.ySpace,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        context: context,
                        controller: controller.recipeIngredientC,
                        hintText: AppStrings.sugarFreeCake,
                        textInputType: TextInputType.text,
                        color: Colors.white,
                        borderColor: AppColor.greyColor,
                      ),
                    ),
                    5.width,
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        context: context,
                      controller: controller.recipeIngredientQuantityC,
                      suffixText: 'g ',
                        textDirection: TextDirection.ltr,
                        color: Colors.white,
                        borderColor: AppColor.greyColor,
                      )
                    ),

                  ],
                ),
              2.ySpace,
              KOutlineButton(
                  onTap: (){
                    KRecipeBottomSheets.addQuantityType(
                      onConfirmTap: (){},
                      c: controller,
                      context,
                    );
                  },
                  btnText: AppStrings.addIngredient,
                  gradient: AppColor.blackGradient,
                textGradient: AppColor.blackGradient,
                fontSize: 15,
              ),
              ],
            ),
            4.ySpace,
            Text(AppStrings.preparationMethod,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            1.ySpace,
            CustomTextField(
              context: context,
              controller: controller.recipeDescriptionC,
              hintText: AppStrings.sugarFreeCake,
              maxLines: 6,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              color: Colors.white,
                borderColor: AppColor.greyColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.info,color: AppColor.greyColor,),
                15.width,
                Expanded(child: KText(text: AppStrings.nutritionalInformationBasedOnIngredients,
                  color: AppColor.greyColor,fontSize: 15,)),
              ],
            ),
            2.ySpace,
            kTextButton(
              onPressed: (){
                Get.to(()=>const RecipeAdded());
              },
              btnText: AppStrings.saveRecipe,
              gradient: AppColor.blackGradient,
              fontSize: 16
            ),
          ],
        ),
      ),
    );
  }
}
