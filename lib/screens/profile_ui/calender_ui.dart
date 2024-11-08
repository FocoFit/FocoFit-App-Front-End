import 'package:flutter/material.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class CalenderUi extends StatelessWidget {
  final ProfileController controller;
  const CalenderUi({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      headerHeight: 80,
      todayHighlightColor: AppColor.endGradient,
      selectionTextStyle: primaryTextStyle(color: Colors.white, fontSize: 14),
      headerStyle: DateRangePickerHeaderStyle(
        textStyle: kTextStyle(

          fontWeight: FontWeight.w600,
        ),
        backgroundColor: AppColor.whiteColor,
        textAlign: TextAlign.center,
      ),
      selectionRadius: 20,
      showNavigationArrow: true,
      startRangeSelectionColor: AppColor.endGradient,
      endRangeSelectionColor: AppColor.endGradient,
      selectionColor: AppColor.endGradient,
      navigationMode: DateRangePickerNavigationMode.snap,
      backgroundColor: AppColor.whiteColor,
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
        if (args.value is PickerDateRange) {
          PickerDateRange selectedRange = args.value;
          if (selectedRange.startDate != null && selectedRange.endDate != null) {
            // Format the selected date range
            String startDate = DateFormat('dd/MM/yyyy').format(selectedRange.startDate!);
            String endDate = DateFormat('dd/MM/yyyy').format(selectedRange.endDate!);
            controller.selectedDateRange.value = '$startDate - $endDate';
          } else {
            controller.selectedDateRange.value = '';
          }
        }
      },
      selectionMode: DateRangePickerSelectionMode.range,
      initialSelectedRange: PickerDateRange(
        DateTime.now().subtract(const Duration(days: 4)),
        DateTime.now().add(const Duration(days: 3)),
      ),
    );
  }
}
