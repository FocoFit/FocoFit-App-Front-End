import 'package:get/get.dart';

class ChartsController extends GetxController {
  ///Chart Variables
  var selectedCaloriesPeriod = 'Semana'.obs;
  var caloriesConsumed = 1000.obs;
  var caloriesBurned = 2000.obs;
  var chartData = <double>[800, 700, 750, 700, 900, 850, 1000].obs;

  // Icm Chart Variables
  var selectedIcmPeriod = 'Semana'.obs;
  var initialWeight = 70.0.obs;
  var currentWeight = 72.0.obs;
  var goalWeight = 68.0.obs;
  var icmChartData = <double>[3.0, 4.0, 5.0, 2.5, 6.0, 7.0, 4.0].obs;
  final semanaData = [3.0, 4.0, 5.0, 2.5, 6.0, 7.0, 4.0];
  final mesData = [10.0, 12.0, 15.0, 9.0];
  final anoData = [40.0, 50.0, 45.0, 60.0];

  // Aqua Chart Variables
  var selectedAquaPeriod = 'Semana'.obs;
  var aquaConsumed = 1000.obs;
  var aquaGoal = 2000.obs;
  var aquaChartData = <double>[1200, 1400, 1500, 1300, 1600, 1800, 2000].obs;

  //feeding variables
  var selectedFeedingPeriod = 'Semana'.obs;
  var feedingKcalConsumed = 1000.obs;
  var feedingKcalBurned = 2000.obs;
  var feedingChartData = <Map<String, double>>[
    {'consumed': 1000, 'burned': 2000},
    {'consumed': 800, 'burned': 1700},
    {'consumed': 900, 'burned': 1800},
    {'consumed': 850, 'burned': 1500},
    {'consumed': 950, 'burned': 1900},
  ].obs;

  //Nutrients variables
  var selectedNutrientsPeriod = 'Semana'.obs;
  var protein = 0.obs;
  var carbs = 0.obs;
  var fat = 0.obs;
  var nutrientsChartData = <Map<String, double>>[
    {'carb': 1000, 'protein': 2000,'fat': 1000},
    {'carb': 800, 'protein': 1800,'fat': 1800},
    {'carb': 850, 'protein': 1500,'fat': 1500},
    {'carb': 950, 'protein': 1900,'fat': 1900},
  ].obs;
  //Fasting variables
  var selectedFastingPeriod = 'Semana'.obs;
  var fastingHistory = 0.obs;
  var fastingChartData = <double>[3.0, 4.0, 5.0, 2.5, 6.0, 7.0, 4.0].obs;
  final semanaFastingData = [16, 18, 17, 15, 20, 16, 18];
  final mesFastingData = [500, 520, 540, 560];
  final anoFastingData = [1000, 2000, 3000, 3000];

  //activity variables
  var selectedActivityPeriod = 'Semana'.obs;
  var totalTimeInMinutes = 0.obs;
  var totalCaloriesBurned = 0.obs;
  final weeklyActivityData = [
    {'time': 60, 'calories': 300},
    {'time': 45, 'calories': 250},
    {'time': 50, 'calories': 280},
    {'time': 70, 'calories': 350},
  ];

  ///Functions
  void updateCaloriesPeriod(String period) {
    selectedCaloriesPeriod.value = period;

    if (period == 'Semana') {
      caloriesConsumed.value = 1000;
      caloriesBurned.value = 2000;
      chartData.value = [800, 700, 750, 700, 900, 850, 1000];  // Weekly data
    } else if (period == 'Mês') {
      caloriesConsumed.value = 4000;
      caloriesBurned.value = 5000;
      chartData.value = [3000, 3500, 4000, 5000];  // Monthly data example
    } else if (period == 'Ano') {
      caloriesConsumed.value = 10000;
      caloriesBurned.value = 15000;
      chartData.value = [10000, 12000, 13000, 15000];  // Annual data example
    }
  } //calories update period

  void updateIcmPeriod(String period) {
    selectedIcmPeriod.value = period;
    if (period == 'Semana') {
      icmChartData.assignAll(semanaData);
    } else if (period == 'Mês') {
      icmChartData.assignAll(mesData);
    } else if (period == 'Ano') {
      icmChartData.assignAll(anoData);
    }
  }  //ICm update period

  void updateAquaPeriod(String period) {
    selectedAquaPeriod.value = period;

    if (period == 'Semana') {
      aquaConsumed.value = 1000;
      aquaGoal.value = 2000;
      aquaChartData.value = [1200, 1400, 1500, 1300, 1600, 1800, 2000];  // Weekly data
    } else if (period == 'Mês') {
      aquaConsumed.value = 4000;
      aquaGoal.value = 8000;
      aquaChartData.value = [4000, 4500, 5000, 5500];  // Monthly data example
    } else if (period == 'Ano') {
      aquaConsumed.value = 10000;
      aquaGoal.value = 20000;
      aquaChartData.value = [10000, 12000, 15000, 18000];  // Annual data example
    }
  }  // Aqua update period

  void updateFeedingPeriod(String period) {
    selectedFeedingPeriod.value = period;
    if (period == 'Semana') {
      feedingChartData.value = [
        {'consumed': 1000, 'burned': 2000},
        {'consumed': 800, 'burned': 1700},
        {'consumed': 900, 'burned': 1800},
        {'consumed': 850, 'burned': 1500},
        {'consumed': 950, 'burned': 1900},
      ];
    } else if (period == 'Mês') {
      feedingChartData.value = [
        {'consumed': 4000, 'burned': 5000},
        {'consumed': 3500, 'burned': 4500},
        {'consumed': 4200, 'burned': 4600},
        {'consumed': 3900, 'burned': 4800},
      ];
    } else if (period == 'Ano') {
      feedingChartData.value = [
        {'consumed': 10000, 'burned': 15000},
        {'consumed': 12000, 'burned': 14000},
        {'consumed': 11000, 'burned': 13500},
        {'consumed': 10500, 'burned': 14500},
      ];
    }
  }    // feeding functions

  void updateNutrientsPeriod(String period) {
    selectedNutrientsPeriod.value = period;

    switch (period) {
      case 'Semana':
        _setNutrientValues(1000, 2000, 1000);
        break;
      case 'Mês':
        _setNutrientValues(800, 1800, 1800);
        break;
      case 'Ano':
        _setNutrientValues(950, 1900, 1900);
        break;
      default:
        break;
    }
  }  // Nutrients functions

  void _setNutrientValues(int carb, int proteinValue, int fatValue) {
    carbs.value = carb;
    protein.value = proteinValue;
    fat.value = fatValue;
  }   // Nutrients functions

  void updateFastingPeriod(String period) {
    selectedFastingPeriod.value = period;
    fetchFastingDataForPeriod(period);
  }          // Fasting functions
  void fetchFastingDataForPeriod(String period) {
    if (period == 'Semana') {
      fastingChartData.value = [10, 12, 14, 8, 16, 18, 20];
      fastingHistory.value = fastingChartData.reduce((a, b) => a + b).toInt();  // Sum of weekly hours
    } else if (period == 'Mês') {
      fastingChartData.value = [200, 210, 220, 230];
      fastingHistory.value = fastingChartData.reduce((a, b) => a + b).toInt();  // Sum of monthly hours
    } else if (period == 'Ano') {
      fastingChartData.value = [1000, 1100, 1200, 1300, 1400];
      fastingHistory.value = fastingChartData.reduce((a, b) => a + b).toInt();  // Sum of annual hours
    }
  } // Fasting functions

  void updateActivityPeriod(String period) {
    selectedActivityPeriod.value = period;

    if (period == 'Semana') {
      totalTimeInMinutes.value = 225;
      totalCaloriesBurned.value = 1180;
    } else if (period == 'Mês') {
      totalTimeInMinutes.value = 900;
      totalCaloriesBurned.value = 4720;
    } else if (period == 'Ano') {
      totalTimeInMinutes.value = 10800;
      totalCaloriesBurned.value = 56800;
    }
  }  // Activity functions

  String get formattedTime {
    final hours = totalTimeInMinutes.value ~/ 60;
    final minutes = totalTimeInMinutes.value % 60;
    return '$hours hours $minutes minutes';
  }  // Activity functions


}
