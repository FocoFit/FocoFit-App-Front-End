import 'package:flutter/cupertino.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// TextEditingControllers
  final TextEditingController searchController = TextEditingController();
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final FixedExtentScrollController kgController =
      FixedExtentScrollController();
  final FixedExtentScrollController grController =
      FixedExtentScrollController();
  final FixedExtentScrollController waterController =
      FixedExtentScrollController();
  final FixedExtentScrollController waterLiterController =
      FixedExtentScrollController();

  /// Variables
  final Rx<DateTime> currentDate = DateTime.now().obs;
  final RxInt selectedDay = DateTime.now().day.obs;
  final daysInMonth = <int>[].obs;

  final RxInt selectedWeightKg = 60.obs;
  final RxInt selectedWeightGr = 600.obs;
  final RxInt selectedWater = 60.obs;
  final RxInt selectedWaterLiter = 600.obs;

  /// Methods
  @override
  void onInit() {
    super.onInit();
    calculateDaysInMonth(currentDate.value);
  }

  void calculateDaysInMonth(DateTime date) {
    final daysInMonthCount = DateTime(date.year, date.month + 1, 0).day;
    daysInMonth.value = List.generate(daysInMonthCount, (index) => index + 1);
  }
}
