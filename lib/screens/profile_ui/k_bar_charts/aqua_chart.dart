import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AquaChart extends StatelessWidget {
  final ChartsController controller;
  final String btnText;
  final Function() onButtonTap;

  const AquaChart({super.key, required this.controller, required this.onButtonTap, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [AppColor.shadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAquaInfo('Ingerido', controller.aquaConsumed),
              _buildAquaInfo('Meta mensal', controller.aquaGoal),
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

  Widget _buildAquaInfo(String label, RxInt value) {
    return Column(
      children: [
        KText(text:  label,fontSize: 15,fontWeight: FontWeight.w500,),
        Obx(() => KText(text: '${value.value} L',
          fontSize: 20, fontWeight: FontWeight.w700),
        ),
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
          _buildPeriodButton('Semana', controller.selectedAquaPeriod.value == 'Semana', 'aqua'),
          _buildPeriodButton('Mês', controller.selectedAquaPeriod.value == 'Mês', 'aqua'),
          _buildPeriodButton('Ano', controller.selectedAquaPeriod.value == 'Ano', 'aqua'),
        ],
      ),
    ));
  }

  Widget _buildPeriodButton(String period, bool isSelected, String chartType) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updateAquaPeriod(period),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
          decoration: BoxDecoration(
            gradient: isSelected ? AppColor.primaryGradient : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: KText(text: period,
                color: isSelected ? Colors.white : AppColor.greyColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
          ),
        ),
      ),
    );
  }

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
                  reservedSize: 40,
                  showTitles: true, // Enable right titles
                  interval: _getIntervalForSelectedPeriod(),
                  getTitlesWidget: (value, meta) {
                    String formattedValue = _formatYAxisLabels(value);
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),                      child: Text(
                        '$formattedValue L',
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
    return controller.aquaChartData.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.blueGradient,
          ),
        ],
      );
    }).toList();
  }

  double _getIntervalForSelectedPeriod() {
    switch (controller.selectedAquaPeriod.value) {
      case 'Semana':
        return 200;
      case 'Mês':
        return 500;
      case 'Ano':
        return 1000;
      default:
        return 200;
    }
  }

  String _formatYAxisLabels(double value) {
    if (controller.selectedAquaPeriod.value == 'Semana' && value > 800) {
      return (value / 1000).toStringAsFixed(1);
    }
    if (controller.selectedAquaPeriod.value == 'Mês' && value >= 500) {
      return (value / 1000).toStringAsFixed(1);
    }
    if (controller.selectedAquaPeriod.value == 'Ano' && value >= 2000) {
      return (value / 1000).toStringAsFixed(1);
    }
    return value.toInt().toString();
  }

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const weeklyLabels = ['31 dom', '1 seg', '2 ter', '3 qua', '4 qui', '5 sex', '6 sáb'];
    const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr','May','Jun','Jul'];
    const annualLabels = ['2017','2018', '2019', '2020', '2021', '2022', '2023'];

    String text = '';

    if (controller.selectedAquaPeriod.value == 'Semana') {
      if (value.toInt() < weeklyLabels.length) {
        text = weeklyLabels[value.toInt()];
      }
    } else if (controller.selectedAquaPeriod.value == 'Mês') {
      if (value.toInt() < monthlyLabels.length) {
        text = monthlyLabels[value.toInt()];
      }
    } else if (controller.selectedAquaPeriod.value == 'Ano') {
      if (value.toInt() < annualLabels.length) {
        text = annualLabels[value.toInt()];
      }
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

