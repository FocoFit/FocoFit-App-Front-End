import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/create_activity_ai.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/create_activity_manually.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateActivityOptions extends StatelessWidget {
  const CreateActivityOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
          onTap: (){
            Navigator.pop(context);
          },
          title: AppStrings.createPhysicalActivity
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage(AppImages.yellowStartImg),height: 250,width: 250,),
              KText(text:  AppStrings.registerRecipeManualAiDescription,
                fontSize: 16,
                textAlign: TextAlign.center,
                color: AppColor.greyColor,
              )
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kTextButton(
                  onPressed: (){
                    Get.to(()=> CreateActivityAi());
                  },
                  btnText: AppStrings.usingFocoFitPro,
                  useGradient: true
              ),
              10.height,
              KOutlineButton(
                  onTap: (){
                    Get.to(()=>  CreateActivityManually());
                  },
                  btnText: AppStrings.createManually,
                  textGradient: AppColor.blackGradient,
                  gradient: AppColor.blackGradient)
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
    );
  }
}
