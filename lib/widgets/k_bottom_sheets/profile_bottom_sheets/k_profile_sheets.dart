import 'package:flutter/material.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/screens/profile_ui/calender_ui.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:get/get.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KProfileSheets {
  static void show({
    required BuildContext context,
    String? title,
    required List<Widget> content,
    Function()? onConfirmTap,
    double heightFactor = 0.4,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.5),
      backgroundColor: AppColor.whiteColor,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 2),
          height: context.isKeyboardVisible ? mQ.height : mQ.height * heightFactor,
          width: mQ.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.isKeyboardVisible ? 30.height : 2.height,
              _buildHeader(),
              3.ySpace,
              _buildTitle(title!),
              const Divider(color: AppColor.lightGreyColor,),
              10.height,
              ...content,
              const Spacer(),
              onConfirmTap!=null?_buildConfirmButton(onConfirmTap):const SizedBox.shrink(),
              4.ySpace,
            ],
          ).paddingSymmetric(horizontal: 4.w),
        );
      },
    );
  }
  static void editHistoricoSheet(BuildContext context, {
    required Function() onConfirmTap,
    required Function() onCancelTap}) {
    show(
      context: context,
      title: AppStrings.historicalEditor,
      content: [
        Align(
            alignment: Alignment.center,
            child: KText(
              text:  AppStrings.whatToDoWithHistory,
              textAlign: TextAlign.center,
              ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: KOutlineButton(
                onTap: onCancelTap,
                btnText: AppStrings.delete,
                gradient: AppColor.blackGradient,
                textGradient: AppColor.blackGradient,
              ),
            ),
            5.xSpace,
            Expanded(
              child: kTextButton(
                onPressed: onConfirmTap,
                btnText: AppStrings.alter,
                useGradient: true,
              ),
            ),
          ],
        ),
      ],
      heightFactor: 0.25,
    );
  }

  static void selectDateRange(BuildContext context, {required ProfileController controller, Function()? onConfirmTap}) {
    show(
      context: context,
      title: AppStrings.chooseDate,
      content: [
        CalenderUi(controller: controller),
        2.ySpace,
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.59,
    );
  }


  static void editWeightHistory(BuildContext context, {Function()? onConfirmTap}) {
    final c = Get.put(ProfileController());
    show(
      context: context,
      title: AppStrings.currentWeight,
      content: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: c.kgController,
                onSelectedItemChanged: (value) {
                  c.selectedWeightKg.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.9,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 120,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == c.selectedWeightKg.value
                          ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: kTextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600
                      ),)
                          : KText(text:
                        index.toString(),
                        fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                    ),
                    );
                  },
                ),
              ),
            ),
            const KText(text: 'Kg',),
            20.width,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListWheelScrollView.useDelegate(
                controller: c.grController,
                onSelectedItemChanged: (value) {
                  c.selectedWeightGr.value = value;
                },
                itemExtent: 65,
                perspective: 0.006,
                diameterRatio: 1.9,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 1000,
                  builder: (context, index) {
                    return Obx(()=> Center(
                      child: index == c.selectedWeightGr.value
                          ? GradientText(text: index.toString(), gradient: AppColor.primaryGradient,style: kTextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600
                      ),)
                          : KText(text:
                        index.toString(),
                        fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                    ),
                    );
                  },
                ),
              ),
            ),
           const  KText(text: 'Gr'),
          ],
        ),
      ],
      onConfirmTap: onConfirmTap,
      heightFactor: 0.45,
    );
  }


  static Widget _buildHeader() {
    return Align(
      alignment: Alignment.center,
      child: showSvgIconWidget(iconPath: AppIcons.dashIcon),
    );
  }

  static Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.center,
      child: KText(
        text: title,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget _buildConfirmButton(Function()? onConfirmTap) {
    return onConfirmTap != null
        ? kTextButton(
      width: mQ.width,
      onPressed: onConfirmTap,
      btnText: AppStrings.save,
      useGradient: true,
      height: 7
    )
        : const SizedBox.shrink();
  }
}
