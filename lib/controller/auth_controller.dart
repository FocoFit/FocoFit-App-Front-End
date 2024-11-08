import 'package:flutter/material.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/goal_weight.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/lets_start.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_datebirth.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_gender.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_medical_conditions.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_name.dart';
import 'package:focofit/screens/auth_ui/registeration_progress_screens/select_weight.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/convert.dart';
import 'package:focofit/utils/local_storage.dart';
import 'package:focofit/widgets/k_app_dialogs.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../screens/auth_ui/registeration_progress_screens/select_height.dart';

class AuthController extends GetxController {
  // Controllers for text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  // Reactive variables
  final RxBool showPassword = true.obs;
  final RxBool isTermsAccepted = false.obs;
  final SupabaseClient supabase = Supabase.instance.client;
  final selectedIndex = (-1).obs;
  final genderList =
      [AppStrings.man, AppStrings.woman, AppStrings.ratherNotSay].obs;

  // final genderForBackend =
  //     [AppStrings.man, AppStrings.woman, AppStrings.ratherNotSay].obs;

  // Toggles the visibility of the password
  void togglePassword() {
    showPassword.value = !showPassword.value;
    update();
  }

  // Sign up function
  Future<void> signUpWithEmail() async {
    final email = emailController.text;
    final password = passwordController.text;
    final hashedPassword = Convert.hashPassword(password);

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      return;
    }

    if (!isTermsAccepted.value) {
      Get.snackbar('Error', 'You must accept the terms and conditions');
      return;
    }

    KLoading.showProcess();

    try {
      final AuthResponse response = await supabase.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/',
      );

      if (response.user != null) {
        final userId = response.user!.id;
        MyLocalStorage.write(MyLocalStorage.userId, userId);

        try {
          // Store user data in the 'users' table
          await supabase.from('users').insert({
            'uuid': userId,
            'email': email,
            'password': hashedPassword,
          });

          KLoading.stopProcess();
          Get.snackbar('Success',
              'Verification email sent to $email. Please check your inbox.');
          Get.to(() => const SelectName());
        } on PostgrestException catch (e) {
          KLoading.stopProcess();
          Get.snackbar('Error', e.message.toString());
        }
      } else {
        KLoading.stopProcess();
        Get.snackbar('Error', 'Sign up failed. Please try again.');
      }
    } on AuthException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
    }
  }

  // Sign in function
  Future<void> signInWithEmail() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
      return;
    }

    KLoading.showProcess();

    try {
      final response = await supabase.auth
          .signInWithPassword(email: email, password: password);

      if (response.user != null) {
        final userId = response.user!.id;
        MyLocalStorage.write(MyLocalStorage.userId, userId);

        KLoading.stopProcess();
        Get.offAll(() => CustomBottomBar());
        Get.snackbar('Success', 'Welcome back, $email!');
      } else {
        KLoading.stopProcess();
        Get.snackbar('Error', 'Login failed. Please check your credentials.');
      }
    } on AuthException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
    }
  }

  // update name function
  Future<void> updateName() async {
    final firstName = firstNameController.text;
    final surName = surNameController.text;

    if (firstName.isEmpty || surName.isEmpty) {
      Get.snackbar('Error', 'Name and Surname cannot be empty');
      return;
    }

    KLoading.showProcess();

    try {
      final userId = await MyLocalStorage.read(MyLocalStorage.userId);

      await supabase.from('users').update({
        'user_name': firstName,
        'user_surname': surName,
      }).eq('uuid', userId);

      KLoading.stopProcess();
      Get.to(() => const SelectGender());
    } on PostgrestException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
    }
  }

  // update gender function
  Future<void> updateGender() async {
    if (selectedIndex.value == -1) {
      Get.snackbar('Error', 'You must select the Gender');
      return;
    }

    KLoading.showProcess();

    try {
      final userId = await MyLocalStorage.read(MyLocalStorage.userId);
      final genderValue = genderList[selectedIndex.value];

      await supabase.from('users').update({
        'gender': genderValue,
      }).eq('uuid', userId);

      KLoading.stopProcess();
      Get.to(() => SelectDateBirth());
    } on PostgrestException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
      debugPrint(e.message);
    }
  }

  // update dob function
  Future<void> updateDob(dob, {bool isProfile = false}) async {
    KLoading.showProcess();

    try {
      final userId = await MyLocalStorage.read(MyLocalStorage.userId);

      await supabase.from('users').update({
        'birthday': dob,
      }).eq('uuid', userId);

      KLoading.stopProcess();
      if (isProfile == true) {
        Get.to(() => const SelectHeight());
      }else{
        final ProfileController profileController= Get.put(ProfileController());
        if (profileController.userData.value != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await profileController.fetchUserProfile();
          });
        }
      }
    } on PostgrestException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
      debugPrint(e.message);
    }
  }

  // update height function
  Future<void> updateHeight(height) async {
    KLoading.showProcess();

    try {
      final userId = await MyLocalStorage.read(MyLocalStorage.userId);

      await supabase.from('users').update({
        'height': height,
      }).eq('uuid', userId);

      KLoading.stopProcess();
      Get.to(() => SelectWeight());
    } on PostgrestException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
      debugPrint(e.message);
    }
  }

  // update current weight function
  Future<void> updateCurrentWeight(currentWeight) async {
    KLoading.showProcess();

    try {
      final userId = await MyLocalStorage.read(MyLocalStorage.userId);

      await supabase.from('users').update({
        'current_weight': currentWeight,
      }).eq('uuid', userId);

      KLoading.stopProcess();
      Get.to(() => GoalWeight());
    } on PostgrestException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
      debugPrint(e.message);
    }
  }

  // update goal weight function
  Future<void> updateGoalWeight(goalWeight) async {
    KLoading.showProcess();

    try {
      final userId = await MyLocalStorage.read(MyLocalStorage.userId);

      await supabase.from('users').update({
        'goal_weight': goalWeight,
      }).eq('uuid', userId);

      KLoading.stopProcess();
      Get.to(() => const SelectMedicalConditions());
    } on PostgrestException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
      debugPrint(e.message);
    }
  }

  // update medical conditions function
  Future<void> updateMedicalConditions(medicalConditions) async {
    KLoading.showProcess();

    try {
      final userId = await MyLocalStorage.read(MyLocalStorage.userId);

      await supabase.from('users').update({
        'medical_conditions': medicalConditions,
      }).eq('uuid', userId);

      KLoading.stopProcess();
      Get.to(() => const LetsStart());
    } on PostgrestException catch (e) {
      KLoading.stopProcess();
      Get.snackbar('Error', e.message.toString());
      debugPrint(e.message);
    }
  }

  // Optional: Clear text fields
  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
    isTermsAccepted.value = false;
  }
}
