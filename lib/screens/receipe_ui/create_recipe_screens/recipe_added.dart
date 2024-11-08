import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/edit_recipe_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecipeAdded extends StatelessWidget {
  const RecipeAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: (){
          Get.back();
        },
        title: AppStrings.createRecipe,
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
          const Image(image: AssetImage(AppImages.greenCheckImg),height: 250,width: 250,),
            KText(text: AppStrings.recipeAddedConsultAnyTime,
              fontSize: 16,textAlign: TextAlign.center,),
        ],).paddingSymmetric(horizontal: 25,vertical: 10)
    ],),
      bottomNavigationBar: kTextButton(
        onPressed: (){
          Get.to(()=> const EditRecipeScreen());
        },
        btnText: AppStrings.viewRecipe,
        gradient: AppColor.blackGradient,
        fontSize: 16
      ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
    );
  }
}
