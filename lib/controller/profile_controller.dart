import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:focofit/models/k_models/recipe_data.dart';
import 'package:focofit/models/user_model.dart';
import 'package:focofit/screens/auth_ui/welcome_screen.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/local_storage.dart';
import 'package:focofit/widgets/k_app_dialogs.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  Rxn<UserModel> userData = Rxn<UserModel>(null);

  ///Wheel Scroll Controller
  final FixedExtentScrollController dateController =
      FixedExtentScrollController();
  final FixedExtentScrollController monthController =
      FixedExtentScrollController();
  final FixedExtentScrollController yearController =
      FixedExtentScrollController();
  final FixedExtentScrollController cmController =
      FixedExtentScrollController();
  final FixedExtentScrollController ftController =
      FixedExtentScrollController();
  final FixedExtentScrollController inchController =
      FixedExtentScrollController();
  final FixedExtentScrollController kgController =
      FixedExtentScrollController();
  final FixedExtentScrollController grController =
      FixedExtentScrollController();

  ///Variables
  final RxInt selectedWeightKg = 0.obs;
  final RxInt selectedWeightGr = 0.obs;
  final RxInt currentDate = 1.obs;
  final RxInt currentMonth = 1.obs;
  final RxInt selectedGenderIndex = (-1).obs;
  final RxInt mySelectedDiet = (-1).obs;
  final RxInt heightInFt = 0.obs;
  final RxInt heightInch = 0.obs;
  final RxInt heightInCm = 0.obs;
  final RxInt currentYear = 1990.obs;
  final RxString selectedHeight = 'cm'.obs;
  final RxBool recalculateCalorieLimit = true.obs;
  final int currentYearValue = DateTime.now().year;
  final RxString selectedDateRange = ''.obs;
  final SupabaseClient supabase = Supabase.instance.client;

  ///CustomLists
  final RxList<String> genderList = [
    AppStrings.masculine,
    AppStrings.feminine,
    AppStrings.iPreferNotToSay
  ].obs;
  final RxList<ActivityLevelList> activityLevelList = [
    ActivityLevelList(
        title: AppStrings.low, subTitle: AppStrings.officeRemoteWork),
    ActivityLevelList(
        title: AppStrings.moderate, subTitle: AppStrings.standingWork),
    ActivityLevelList(
        title: AppStrings.high, subTitle: AppStrings.physicallyDemandingWork),
    ActivityLevelList(
        title: AppStrings.xima, subTitle: AppStrings.heavyPhysicalWork)
  ].obs;

  // Method to fetch user profile data
  Future<void> fetchUserProfile() async {
    try {
      final userId = MyLocalStorage.read(MyLocalStorage.userId);
      if (userId == null) {
        throw Exception('User not logged in');
      }

      final response =
          await supabase.from('users').select().eq('uuid', userId).single();

      userData.value = UserModel.fromJson(response);

      log(userData.value!.userName.toString());
    } on PostgrestException catch (e) {
      Get.snackbar('Error', e.message.toString());
      debugPrint(e.message);
    }
  }

  // logout function
  Future<void> logout() async {
    KLoading.showProcess();

    try {
      await Supabase.instance.client.auth.signOut();
      MyLocalStorage.remove(MyLocalStorage.userId);
      KLoading.stopProcess();
      Get.offAll(() => const WelcomeScreen());
    } on PostgrestException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
      debugPrint(e.message);
    }
  }

  /// Methods
  @override
  void onInit() async {
    super.onInit();
    if (userData.value == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await fetchUserProfile();
      });
    }
  }
}
