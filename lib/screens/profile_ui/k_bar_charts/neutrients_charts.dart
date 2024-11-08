import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:focofit/controller/charts_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NutrientsCharts extends StatelessWidget {
  final ChartsController controller;

  const NutrientsCharts({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: _containerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNutrientsInfoRow(),
          20.height,
          _buildPeriodButtons(),
          20.height,
          _buildLegend(),
          1.ySpace,
          _buildBarChart(),
          20.height,
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2), // Column for meal name
              1: FlexColumnWidth(2), // Column for participation
              2: FlexColumnWidth(1), // Column for calories
            },

            border: TableBorder.all(color: Colors.transparent), // No border
            children: [
              // Table Header
              const TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColor.lightGreyColor), // Border for header
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: KText(text: 'Macronutriente', fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: KText(text: 'Consumido', fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: KText(text: 'Meta', fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              // Data Rows
              _buildNutrientDetalRow('Café da manhã', '2800 g', '1500 g'),
              _buildNutrientDetalRow('Almoço', '2800 g', '1500 g'),
              _buildNutrientDetalRow('jantar', '2800 g', '1500 g'),
              _buildNutrientDetalRow('lanches', '2800 g', '1500 g'),

            ],
          ),
          2.ySpace,
        ],
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: AppColor.whiteColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [AppColor.shadow],
    );
  }

  TableRow _buildNutrientDetalRow(String meal, String participation, String calories) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.lightGreyColor),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical:  8.0),
          child: KText(text: meal, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:  8.0),
          child: KText(text: participation, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:  8.0),
          child: KText(text: calories, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildNutrientsInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNutrientsInfo('Carboidrato', controller.carbs),
        _buildNutrientsInfo('Proteína', controller.protein),
        _buildNutrientsInfo('Gordura', controller.fat),
      ],
    );
  }

  Widget _buildNutrientsInfo(String label, RxInt value) {
    return Column(
      children: [
        KText(text:  label,fontSize: 15,fontWeight: FontWeight.w500,),
        Obx(() => KText(text: '${value.value} g',
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
          _buildPeriodButton('Semana', controller.selectedNutrientsPeriod.value == 'Semana'),
          _buildPeriodButton('Mês', controller.selectedNutrientsPeriod.value == 'Mês'),
          _buildPeriodButton('Ano', controller.selectedNutrientsPeriod.value == 'Ano'),
        ],
      ),
    ));
  }

  Widget _buildPeriodButton(String period, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updateNutrientsPeriod(period),
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

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(AppColor.greenColor, 'Carboidrato'),
        3.xSpace,
        _buildLegendItem(AppColor.redColor, 'Proteína'),
        3.xSpace,
        _buildLegendItem(AppColor.endGradient, 'Gordura'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        1.xSpace,
        KText(text:  label,fontSize: 13, fontWeight: FontWeight.w500),
      ],
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 300,
      child: Obx(() => BarChart(
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
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 40,
                showTitles: true,
                interval: _getIntervalForSelectedPeriod(),
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),                    child: Text(
                      _formatValue(value.toInt()),
                      style: kTextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
      )),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    if (controller.nutrientsChartData.isEmpty) {
      return [];
    }
    return controller.nutrientsChartData.asMap().entries.map((entry) {
      int index = entry.key;
      var data = entry.value;
      double carbValue = data['carb'] ?? 0;
      double proteinValue = data['protein'] ?? 0;
      double fatValue = data['fat'] ?? 0;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: carbValue,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.greenGradient,
          ),
          BarChartRodData(
            toY: proteinValue,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.redGradient,
          ),
          BarChartRodData(
            toY: fatValue,
            width: 8,
            borderRadius: BorderRadius.circular(4),
            gradient: AppColor.primaryGradient,
          ),
        ],
        barsSpace: 2,
      );
    }).toList();
  }


  double _getIntervalForSelectedPeriod() {
    switch (controller.selectedNutrientsPeriod.value) {
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

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    const weeklyLabels = ['31 dom', '1 seg', '2 ter', '3 qua', '4 qui', '5 sex', '6 sáb'];
    const monthlyLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
    const annualLabels = ['2017', '2018', '2019', '2020', '2021', '2022', '2023'];

    String text = '';
    if (controller.selectedNutrientsPeriod.value == 'Semana') {
      text = _getLabelForValue(value, weeklyLabels);
    } else if (controller.selectedNutrientsPeriod.value == 'Mês') {
      text = _getLabelForValue(value, monthlyLabels);
    } else if (controller.selectedNutrientsPeriod.value == 'Ano') {
      text = _getLabelForValue(value, annualLabels);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(text, style: kTextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  String _getLabelForValue(double value, List<String> labels) {
    return value.toInt() < labels.length ? labels[value.toInt()] : '';
  }

  String _formatValue(int value) {
    return value >= 1000 ? '${(value / 1000).toStringAsFixed(1)}k' : value.toString();
  }

}
