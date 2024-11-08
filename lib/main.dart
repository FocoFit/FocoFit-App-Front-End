import 'package:flutter/material.dart';
import 'package:focofit/screens/auth_ui/splash_screen.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'controller/language_controller.dart';
import 'screens/auth_ui/registeration_progress_screens/select_medical_conditions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Languages.loadTranslations();

  await Supabase.initialize(
    url: 'https://bdognqurunnyrytonaji.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJkb2ducXVydW5ueXJ5dG9uYWppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU3NDkyMzAsImV4cCI6MjA0MTMyNTIzMH0.rP4WA-RNma796jx0Ay1Zczg0ajZ_6YE53KEnlXgu71M',
    authOptions:
        const FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
  );

  runApp(
      // Commenting out DevicePreview to check if it's the source of the issue
      // DevicePreview(
      //     enabled: true,
      //     builder: (context) => const MyApp()),
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'FocoFit',
          debugShowCheckedModeBanner: false,
          locale: Locale(
            Languages.languageCode.toString(),
            Languages.countryCode.toString(),
          ),
          translations: Languages(),
          fallbackLocale: Locale(
            Languages.languageCode.toString(),
            Languages.countryCode.toString(),
          ),
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.whiteColor,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          // home: const SelectMedicalConditions(),
          // for checking the responsiveness of the app
          useInheritedMediaQuery: true,
        );
      },
    );
  }
}
