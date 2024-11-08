import 'package:flutter/material.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class CaloriesContainer extends StatelessWidget {
  final String title;
  final String consumedTitle;
  final String burnTitle;
  final String totalCalories;
  final String calories;
  final String consumed;
  final String burned;
  final double progress;
  final String carbohydrate;
  final double carbPercent;
  final String protein;
  final double proteinPercent;
  final String fat;
  final double fatPercent;

  const CaloriesContainer({
    super.key,
    required this.title,
    required this.totalCalories,
    required this.consumed,
    required this.burned,
    required this.progress,
    required this.carbohydrate,
    required this.carbPercent,
    required this.protein,
    required this.proteinPercent,
    required this.fat,
    required this.fatPercent,
    required this.consumedTitle,
    required this.burnTitle,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: AppColor.lightGreyColor,
            blurRadius: 5,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Stack(

            children: [
              ColoredBox(
                  color: AppColor.whiteColor,
                  child: SizedBox(
                      height: 30.h,
                      child: _buildDistanceTrackerExample())),
              Positioned(
                top: 0,
                left: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(text: title,fontWeight: FontWeight.w500,),
                    KText(text: totalCalories,fontWeight: FontWeight.w700,fontSize: 20),
                    KText(text: consumedTitle,fontWeight: FontWeight.w500,),
                    KText(text: consumed,fontWeight: FontWeight.w700,fontSize: 20),
                    KText(text: burnTitle,fontWeight: FontWeight.w500,),
                    KText(text: burned,fontWeight: FontWeight.w700,fontSize: 20),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(text: AppStrings.carbohydrate,fontSize: 13, fontWeight: FontWeight.w500),
                          KText(text: carbohydrate, fontWeight: FontWeight.w500),
                          LinearPercentIndicator(
                            animation: true,
                            padding: EdgeInsets.zero,
                            backgroundColor: AppColor.lightGreyColor,
                            linearGradient: AppColor.greenGradient,
                            linearStrokeCap: LinearStrokeCap.butt,
                            barRadius: const Radius.circular(12),
                            animationDuration: 1000,
                            lineHeight: 12.0,
                            percent: carbPercent,
                          ),
                        ],
                      ),
                    ),
                   2.xSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(text: AppStrings.protein,fontSize: 13, fontWeight: FontWeight.w500),
                          KText(text: protein, fontWeight: FontWeight.w500),
                          LinearPercentIndicator(
                            animation: true,
                            padding: EdgeInsets.zero,
                            backgroundColor: AppColor.lightGreyColor,
                            linearGradient: AppColor.redGradient,
                            linearStrokeCap: LinearStrokeCap.butt,
                            barRadius: const Radius.circular(12),
                            animationDuration: 1000,
                            lineHeight: 12.0,
                            percent: proteinPercent,
                          ),
                        ],
                      ),
                    ),
                   2.xSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(text: AppStrings.fat,fontSize: 13, fontWeight: FontWeight.w500),
                          KText(text: fat, fontWeight: FontWeight.w500),
                          LinearPercentIndicator(
                            animation: true,
                            padding: EdgeInsets.zero,
                            linearGradient: AppColor.primaryGradient,
                            backgroundColor: AppColor.lightGreyColor,
                            linearStrokeCap: LinearStrokeCap.butt,
                            barRadius: const Radius.circular(12),
                            animationDuration: 1000,
                            lineHeight: 12.0,
                            percent: fatPercent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
  Widget _buildDistanceTrackerExample() {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showTicks: false,
          radiusFactor: 0.76,
          maximum: 100,
          endAngle: 35,
          startAngle: 145,
          minimum: 0,
          centerX: 0.7,
          centerY: 0.39,
          axisLineStyle: const AxisLineStyle(
            cornerStyle: CornerStyle.bothCurve,
            thickness: 12,
            color: AppColor.lightGreyColor,
          ),
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 60,
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  KText(text: totalCalories ,fontSize: 24, fontWeight: FontWeight.w800),
                  KText(text: calories ,
                    fontWeight: FontWeight.w500,fontSize: 15,)
                ],
              ),
              verticalAlignment: GaugeAlignment.center,
            ),
          ],
          pointers: const <GaugePointer>[
             RangePointer(
              value: 100,
              width: 20,
              pointerOffset: -1,
              cornerStyle: CornerStyle.bothCurve,
              gradient: SweepGradient(
                colors: <Color>[AppColor.startGradient, AppColor.endGradient],
                stops: <double>[0.5, 0.8],
              ),
            ),
          ],


        ),
      ],
    );
  }
}
