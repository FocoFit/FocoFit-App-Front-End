import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/recipe_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/generating_recipe.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateRecipeAi extends StatelessWidget {
  CreateRecipeAi({super.key});
  final RecipeController controller= Get.find(tag: 'recipeController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        title: AppStrings.createRecipe,
        onTap: (){
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            2.ySpace,
            KText(text: AppStrings.recipeName, fontSize: 16,fontWeight: FontWeight.w500),
            1.ySpace,
            CustomTextField(
              context: context,
              controller: controller.recipeNameC,
              hintText: AppStrings.sugarFreeCake,
              color: Colors.white,
              textInputType: TextInputType.text,
              borderColor: AppColor.greyColor,
            ),
            2.ySpace,
            KText(text: AppStrings.recipeDescriptionOptional, fontSize: 16,fontWeight: FontWeight.w400),
            1.ySpace,
            CustomTextField(
              context: context,
              controller: controller.recipeDescriptionC,
              hintText: '${AppStrings.example}: ${AppStrings.recipeDemand}',
              maxLines: 5,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
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
                Expanded(child: KText(text:  AppStrings.nutritionalInformationBasedOnIngredients,
                  fontSize: 15,
                  color: AppColor.greyColor,

                ),
                )
              ],
            ),
            2.ySpace,
            kTextButton(
              onPressed: (){
                Get.to(()=> const GeneratingRecipe());
              },
              btnText: AppStrings.createRecipe,
              gradient: AppColor.blackGradient,
              fontSize: 16
            ),
          ],
        ),
      ),
    );
  }
}
