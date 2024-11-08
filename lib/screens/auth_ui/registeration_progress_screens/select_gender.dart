import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: Get.put(AuthController()),
        builder: (c) {
          return Scaffold(
            appBar: kAppBar(onTap: () {
              Navigator.pop(context);
            }),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                2.ySpace,
                KText(
                  text: AppStrings.whatsYourGender,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
                1.ySpace,
                KText(
                  text: AppStrings.tellYourGender,
                ),
                3.ySpace,
                ListView.separated(
                  itemCount: c.genderList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return 2.ySpace;
                  },
                  itemBuilder: (context, index) {
                    return Obx(
                      () => ListTile(
                        onTap: () => c.selectedIndex.value = index,
                        title: KText(text: c.genderList[index].toString()),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: c.selectedIndex.value == index
                                    ? AppColor.startGradient
                                    : AppColor.greyColor,
                                width: c.selectedIndex.value == index ? 2 : 1)),
                      ),
                    );
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 12, vertical: 15),
            bottomNavigationBar: kTextButton(
                    onPressed: () async {
                      await c.updateGender();
                    },
                    btnText: AppStrings.continuue,
                    useGradient: true)
                .paddingSymmetric(horizontal: 5.w, vertical: 3.h),
          );
        });
  }
}
