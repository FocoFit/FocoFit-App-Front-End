import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/profile_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/profile_bottom_sheets/k_profile_sheets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WeightHistoryScreen extends StatelessWidget {
  const WeightHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: Get.put(ProfileController(), tag: 'profileController'),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(
            onTap: ()=>Navigator.pop(context),
            title: AppStrings.countryHistory,
            titleSize: 18
          ),
          body: Column(
            children: [
              ///show date range
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.blackColor),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Display selected date range
                    Obx(() => Padding(
                      padding: EdgeInsets.only(left:  5.w),
                      child: Text(
                        c.selectedDateRange.value.isNotEmpty
                            ? c.selectedDateRange.value
                            : AppStrings.noDateSelected,
                        style: kTextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
                    GestureDetector(
                      onTap: () {
                        KProfileSheets.selectDateRange(
                          context,
                          controller: c,
                          onConfirmTap: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.blackColor,
                        ),
                        child: showSvgIconWidget(
                          onTap: (){
                            KProfileSheets.selectDateRange(
                              context,
                                controller: c,
                                onConfirmTap: (){
                                  Navigator.pop(context);
                                },
                            );
                          },
                            iconPath: AppIcons.barIcon,
                          color: AppColor.whiteColor

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              10.height,
              Expanded(
                child: ListView.separated(
                  itemCount: 31,

                    itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text('88,5 kg'),
                    subtitle: const Text('Hoje, 12 de Agosto de 2024, às 10:41'),
                    subtitleTextStyle: kTextStyle(fontSize: 14,color: AppColor.greyColor,fontWeight: FontWeight.w500),
                    titleTextStyle: kTextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                    trailing: Row(

                      mainAxisSize: MainAxisSize.min ,
                      children: [
                        GradientText(
                          text:
                          index==2?'-0,42':'+1,25'
                          ,gradient: index==2?AppColor.greenGradient:AppColor.redGradient,
                          style: kTextStyle(
                              color: AppColor.redColor,fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                            onPressed: (){
                          KProfileSheets.editHistoricoSheet(context,
                              onConfirmTap: (){
                            Navigator.pop(context);
                            KProfileSheets.editWeightHistory(context,
                                onConfirmTap: (){Navigator.pop(context);});
                              },
                              onCancelTap: (){
                            Navigator.pop(context);
                          });

                        },
                            icon: const Icon(Icons.more_vert))

                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                  );
                },

                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(endIndent: 40, indent: 20,color: AppColor.lightGreyBorder,);
                  },
              ),)
            ],
          ).paddingSymmetric(horizontal: 20,vertical: 10),
        );
      }
    );
  }
}
