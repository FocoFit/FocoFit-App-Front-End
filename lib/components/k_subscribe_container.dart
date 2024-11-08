import 'package:flutter/material.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

class SubScribedContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  const SubScribedContainer({super.key, required this.onTap, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: mQ.width,
        decoration: BoxDecoration(
          gradient: AppColor.primaryGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: const Image(image: AssetImage(AppImages.crownImg)),
          title:  KText(text: title,color: AppColor.whiteColor,fontWeight: FontWeight.w700,fontSize: 15,),
          subtitle:   KText(text: subTitle,color: AppColor.whiteColor,fontWeight: FontWeight.w600,fontSize: 13,),
        ),
      ),
    );
  }
}
