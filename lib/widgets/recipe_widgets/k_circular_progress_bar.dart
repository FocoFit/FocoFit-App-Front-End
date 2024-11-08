import 'package:flutter/material.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KCircularProgressBar extends StatelessWidget {
  final String consumed;
  final String dietName;
  final LinearGradient lineGradient;
  final double progressValue;
  double? radius;
  KCircularProgressBar({super.key, required this.consumed, required this.dietName, required this.lineGradient, required this.progressValue, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animationDuration: 1000,
      linearGradient: lineGradient,
      animation: true,
      restartAnimation: true,
      rotateLinearGradient: true,
      backgroundColor: AppColor.lightGreyColor,
      fillColor: Colors.transparent,
      circularStrokeCap: CircularStrokeCap.round,
      radius: radius?? 6.4.h,
      lineWidth: 6,
      backgroundWidth: 8,
      percent: progressValue,
      curve: Curves.easeIn,
      reverse: true,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientText(text: consumed, gradient: lineGradient, style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          KText(text: dietName, textAlign: TextAlign.center,fontSize: 12,fontWeight: FontWeight.w500,),
        ],
      ),
    );
  }
}
