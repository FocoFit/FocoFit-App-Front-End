import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_ai.dart';
import 'package:focofit/screens/receipe_ui/create_recipe_screens/create_recipe_manual.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateRecipeOption extends StatelessWidget {
  const CreateRecipeOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: AppStrings.createRecipe
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage(AppImages.yellowStartImg),height: 250,width: 250,),
          KText(text: AppStrings.registerRecipeManualAiDescription,fontSize: 16,textAlign: TextAlign.center,color: AppColor.greyColor,)
        ],
      ).paddingSymmetric(horizontal: 4.w,),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            kTextButton(
                onPressed: (){
                  Get.to(()=> CreateRecipeAi());
                },
                btnText: AppStrings.usingFocoFitPro,
                useGradient: true,
              fontSize: 16,
            ),
            1.ySpace,
            KOutlineButton(
                onTap: (){
                  Get.to(()=>CreateRecipeManual());
                },
                btnText: AppStrings.createManually,
                textGradient: AppColor.blackGradient,
                gradient: AppColor.blackGradient,
                fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
