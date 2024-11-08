import 'package:focofit/screens/auth_ui/onboarding_screen.dart';
import 'package:focofit/screens/nav_bar/k_bottom_navigation.dart';
import 'package:focofit/utils/local_storage.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController extends GetxController {
  ///Functions
  Future<void> navigateTo() async {
    await Future.delayed(const Duration(seconds: 3), () {
      final session = Supabase.instance.client.auth.currentSession;

      if (session == null) {
        Get.offAll(() => KOnboardingScreen());
      } else {
        Get.offAll(() => CustomBottomBar());
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    navigateTo();
  }
}
