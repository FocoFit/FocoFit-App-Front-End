import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CaloriesGraphScreen extends StatelessWidget {
  final ChartsController controller;
  final String btnText;
  final Function() onButtonTap;
  const CaloriesGraphScreen({super.key, required this.controller,required this.onButtonTap,required this.btnText,});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow:const [
          AppColor.shadow
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCaloriesInfo('Kcal consumidas', controller.caloriesConsumed),
              _buildCaloriesInfo('Kcal queimadas', controller.caloriesBurned),
            ],
          ),
          3.ySpace,
          _buildPeriodButtons(),
          3.ySpace,
          _buildBarChart(),
          3.ySpace,
          kTextButton(btnText: btnText, onPressed: onButtonTap, useGradient: true)
        ],
      ),
    );
  }

  Widget _buildCaloriesInfo(String label, RxInt value) {
    return Column(
      children: [
        KText(text:  label,fontSize: 15,fontWeight: FontWeight.w500,),
        Obx(() => KText(text:
          '${value.value} kcal',
              fontSize: 20, fontWeight: FontWeight.w700
        )),
      ],
    );
  }

  Widget _buildPeriodButtons() {
    return Obx(() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.greyBorder),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPeriodButton('Semana', controller.selectedCaloriesPeriod.value == 'Semana'),
            _buildPeriodButton('Mês', controller.selectedCaloriesPeriod.value == 'Mês'),
            _buildPeriodButton('Ano', controller.selectedCaloriesPeriod.value == 'Ano'),
          ],
        ),
    ),
    );
  }

  // Widget for an individual period button
  Widget _buildPeriodButton(String period, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updateCaloriesPeriod(period),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          margin: const EdgeInsets.symmetric( horizontal: 2.0,vertical: 2),
          decoration: BoxDecoration(
            gradient: isSelected?AppColor.primaryGradient:null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: KText(text:
            period,
              color: isSelected ? Colors.white : AppColor.greyColor,
              fontWeight: FontWeight.w600,
              fontSize: 15
          ),
        ),
      ),
    );
  }

  // Widget to build the bar chart
  Widget _buildBarChart() {
    return SizedBox(
      height: 300,
      child: Obx(
            () => BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            barGroups: _buildBarGroups(),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: _buildBottomTitles,
                ),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Disable left titles
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 33,
                  showTitles: true,   // Enable right titles
                  interval: _getIntervalForSelectedPeriod(),
                  getTitlesWidget: (value, meta) {
                    String formattedValue = _formatYAxisLabels(value);
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        formattedValue,
                        style: kTextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Disable top titles
                ),
              ),
            ),
            borderData: FlBorderData(show: false),

            gridData: FlGridData(
              show: true,
              horizontalInterval: _getIntervalForSelectedPeriod(),  // Interval for horizontal lines
              drawVerticalLine: false,

              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: AppColor.greyColor.withOpacity(0.2),
                  strokeWidth: 1,

                );
              },
            ),
          ),
        ),
      ),
    );
  }



  List<BarChartGroupData> _buildBarGroups() {
    return controller.chartData
        .asMap()
        .entries
        .map((entry) => BarChartGroupData(
      x: entry.key,
      barRods: [
        BarChartRodData(
          toY: entry.value,
          width: 8,
          borderRadius: BorderRadius.circular(4),
          gradient: AppColor.primaryGradient,

        ),
      ],
    ))
        .toList();
  }

  // Method to determine the interval based on the selected period
  double _getIntervalForSelectedPeriod() {
    switch (controller.selectedCaloriesPeriod.value) {
      case 'Semana':
        return 200;  // Adjust as needed
      case 'Mês':
        return 500;  // Adjust as needed
      case 'Ano':
        return 1000;  // Adjust as needed
      default:
        return 200;  // Default interval
    }
  }
  String _formatYAxisLabels(double value) {
    // For Semana period, show values in K after 800
    if (controller.selectedCaloriesPeriod.value == 'Semana' && value > 800) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }

    // For Mês period, show values in K after 500
    if (controller.selectedCaloriesPeriod.value == 'Mês' && value >= 500) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }

    // For Ano, handle any large values
    if (controller.selectedCaloriesPeriod.value == 'Ano' && value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }

    // Otherwise, return normal values
    return value.toInt().toString();
  }


  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const weeklyLabels = ['31 dom', '1 seg', '2 ter', '3 qua', '4 qui', '5 sex', '6 sáb'];
    const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr'];
    const annualLabels = ['2019', '2020', '2021', '2022','2023'];

    String text = '';

    if (controller.selectedCaloriesPeriod.value == 'Semana') {
      text = weeklyLabels[value.toInt()];
    } else if (controller.selectedCaloriesPeriod.value == 'Mês') {
      text = monthlyLabels[value.toInt()];
    } else if (controller.selectedCaloriesPeriod.value == 'Ano') {
      text = annualLabels[value.toInt()];
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(
        text,
        style: kTextStyle(fontSize: 14,fontWeight: FontWeight.w500),
      ),
    );
  }
}
