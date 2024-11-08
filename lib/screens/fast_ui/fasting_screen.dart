import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/controller/fasting_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_bottom_sheets/fasting_bottom_sheets.dart';
import 'package:focofit/screens/fast_ui/see_fasting.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FastingScreen extends StatelessWidget {
  FastingScreen({super.key});

  final ScrollController _scrollController = ScrollController();
  final RxBool isBlurVisible = true.obs;

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isBottom = _scrollController.position.pixels == _scrollController.position.maxScrollExtent;
        isBlurVisible.value = !isBottom;
      } else {
        isBlurVisible.value = true;
      }
    });

    return Scaffold(
      appBar: kAppBar(
        title: AppStrings.intermittentFasting,
        shadowColor: AppColor.blackColor.withOpacity(0.5)
      ),
      body: GetBuilder<FastingController>(
        init: Get.put(FastingController()),
        tag: 'fastingController',
        builder: (controller) {
          return Column(
            children: [
              3.ySpace,
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView.builder(
                      controller: _scrollController, // Attach the ScrollController
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Obx(() => GestureDetector(
                          onTap: () => controller.selectedFasting.value = index,
                          child: _buildFastingOption(controller, index),
                        ));
                      },
                    ),
                    // Use Obx only for controlling the blur visibility
                    Obx(() {
                      return AnimatedOpacity(
                        opacity: isBlurVisible.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                              child: Container(
                                color: AppColor.whiteColor.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Obx(() => _buildConfirmButton(controller, context)),
              2.ySpace,
            ],
          ).paddingSymmetric(horizontal: 2.h, vertical: 0.5.h);
        },
      ),
    );
  }




  Widget _buildFastingOption(FastingController controller, int index) {
    final isSelected = controller.selectedFasting.value == index;

    return Container(
      margin: EdgeInsets.only(bottom: 3.h),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColor.startGradient : AppColor.lightGreyBorder,
        ),
        boxShadow: const [AppColor.shadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const KText(
            text: '12 - 12',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          _buildDivider(),
          _buildFastingDetails(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 0.2.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: AppColor.lightGreyBorder,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildFastingDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFastingRow('12 ${AppStrings.fastingHours}'),
        1.ySpace,
        _buildFastingRow('12 ${AppStrings.hoursEating}'),
      ],
    );
  }

  Widget _buildFastingRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1.5.h,
          width: 1.5.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColor.primaryGradient,
          ),
        ),
        2.xSpace,
        KText(
          text: text,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget _buildConfirmButton(FastingController controller, BuildContext context) {
    final isSelectionValid = controller.selectedFasting.value != -1;
    return kTextButton(
      btnText: AppStrings.confirmSelection,
      onPressed: isSelectionValid
          ? () {
        KFastBottomSheet.selectTimeSheet(
          context,
          onConfirmTap: () {
            Navigator.pop(context);
            Get.to(() => const SeeFasting());
          },
        );
      }
          : null,
      color: isSelectionValid ? null : AppColor.lightGreyBorder,
      useGradient: isSelectionValid,
      fontSize: 16,
    );
  }
}
