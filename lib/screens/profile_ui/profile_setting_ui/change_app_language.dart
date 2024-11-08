import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/utils/local_storage.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangeAppLanguage extends StatelessWidget {
  ChangeAppLanguage({super.key});

  final RxList appLanguages = [
    'English',
    'Portugese',
  ].obs;

  final RxInt selectedLanguage = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: kAppBar(
          title: AppStrings.switchLanguage,
          onTap: () {
            Get.back();
          },
          titleSize: 18),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          3.ySpace,
          KText(
            text: AppStrings.switchLanguageToEnjoyTHeApp,
          ),
          2.ySpace,
          Expanded(
            child: ListView.separated(
              itemCount: appLanguages.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => ListTile(
                    onTap: () => selectedLanguage.value = index,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: selectedLanguage.value == index
                                ? AppColor.startGradient
                                : AppColor.greyColor,
                            width: selectedLanguage.value == index ? 2 : 1)),
                    title: KText(text: appLanguages[index].toString()),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return 2.ySpace;
              },
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 4.w),
      bottomNavigationBar: kTextButton(
        btnText: AppStrings.save,
        onPressed: () {
          if (selectedLanguage.value == 0) {
            MyLocalStorage.write(MyLocalStorage.languageName, 'English');
            MyLocalStorage.write(MyLocalStorage.languageCode, 'en');
            MyLocalStorage.write(MyLocalStorage.languageCountryCode, 'US');
            Get.updateLocale(const Locale('en', 'US'));
            printWarning('English set as default Language');
          } else if (selectedLanguage.value == 1) {
            MyLocalStorage.write(MyLocalStorage.languageName, 'Portugese');
            MyLocalStorage.write(MyLocalStorage.languageCode, 'pt');
            MyLocalStorage.write(MyLocalStorage.languageCountryCode, 'PT');
            Get.updateLocale(const Locale('pt', 'PT'));
            printWarning('Portugese set as default Language');
          }
        },
      ).paddingSymmetric(horizontal: 4.w, vertical: 3.h),
    );
  }
}
