import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/create_activity_options.dart';
import 'package:focofit/screens/home_ui/add_physical_activity/edit_physical_activity.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/home_bottom_sheets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllPhysicalActivity extends StatelessWidget {
  const AllPhysicalActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(tag: 'homeController'),
      builder: (c) {
        return Scaffold(
          appBar: kAppBar(

            onTap: () {
              Get.back();
            },
            trailingOnTap: () {
              Get.to(() => const CreateActivityOptions());
            },
            title: AppStrings.physicalActivity,
            titleSize: 18,
            trailingIcon: AppIcons.plusIcon,
            subTitle: '0 ${AppStrings.kcal}',
          ),
          body: DefaultTabController(
            length: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  15.0,vertical: 10),
              child: Column(
                children: [
                  /// search container
                  CustomTextField(
                    context: context,
                    controller: c.searchController,
                    prefixIcon: AppIcons.searchIcon,
                    hintText: AppStrings.whatYouDoToday,
                    fieldBorderRadius: 32,
                  ),
                  3.ySpace,
                  Container(
                    height: mQ.height*0.05,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: AppColor.greyBorder),
                    ),
                    child: TabBar(
                      unselectedLabelColor: AppColor.greyColor,
                      splashBorderRadius: BorderRadius.circular(24),
                      labelStyle: kTextStyle(
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      unselectedLabelStyle: kTextStyle(
                        color: AppColor.blackColor,
                        fontSize: 15,
                      ),
                      indicator: BoxDecoration(
                        gradient: AppColor.primaryGradient,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(text: AppStrings.all),
                        Tab(text: AppStrings.favorites),
                        Tab(text: AppStrings.created),
                      ],
                    ),
                  ),
                  2.ySpace,
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// All Physical Activity Tab Bar-----------------------------------
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const KText(text: 'Recentes',fontWeight: FontWeight.w600,),
                        Slidable(
                          direction: Axis.horizontal,
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: AppColor.greenColor,
                                foregroundColor: Colors.white,
                                icon: Icons.favorite,
                                label: 'Like',
                                autoClose: false,
                                borderRadius: BorderRadius.circular(16),

                              ),
                            ],
                          ),
                          child: ListTile(
                            title: KText(text: AppStrings.chocolateFilledBiscuit,fontWeight: FontWeight.w500,fontSize: 15,),
                            subtitle: KText(text: '${AppStrings.calories}: ${AppStrings.sweetRiceCalories}',fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.greyColor,),
                            trailing: _trailingButton(onTap: (){
                              KHomeBottomSheet.addPhysicalActivity(context);
                            }),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        const Divider(color: AppColor.lightGreyColor,),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Slidable(
                                direction: Axis.horizontal,
                                startActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: AppColor.greenColor,
                                      foregroundColor: Colors.white,
                                      icon: Icons.favorite,
                                      label: 'Like',
                                      autoClose: false,
                                      borderRadius: BorderRadius.circular(16),
                          
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: KText(text: AppStrings.chocolateFilledBiscuit,fontWeight: FontWeight.w500,
                                    fontSize: 15,),
                                  subtitle: KText(text: '${AppStrings.calories}: ${AppStrings.sweetRiceCalories}',
                                    fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.greyColor,),
                                  trailing: _trailingButton(onTap: (){
                                    KHomeBottomSheet.addPhysicalActivity(context);
                                  }),
                                  contentPadding: EdgeInsets.zero,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                        /// favourites Physical Activity Tab Bar-----------------------------------
                      ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: KText(text: AppStrings.myPhysicalActivity,fontWeight: FontWeight.w500),
                                subtitle: KText(text: '${AppStrings.calories}: ${AppStrings.sweetRiceCalories}',
                                  fontSize: 14, fontWeight: FontWeight.w500,color: AppColor.greyColor,),
                                trailing: _trailingButton(onTap: (){
                                  KHomeBottomSheet.addPhysicalActivity(context);
                                }),
                                contentPadding: EdgeInsets.zero,
                              );
                            }),
                        /// Created Physical Activity Tab Bar-----------------------------------
                        ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: Row(
                                  children: [
                                    Expanded(child: KText(text: AppStrings.myPhysicalActivity,
                                      fontWeight: FontWeight.w500,maxLines: 2,overflow: TextOverflow.ellipsis,),),
                                  showSvgIconWidget(
                                      onTap: (){
                                        Get.to(()=> const EditPhysicalActivity());
                                      },
                                      iconPath: AppIcons.editIcon)
                                  ],
                                ),
                                subtitle: KText(text: '${AppStrings.calories}: ${AppStrings.sweetRiceCalories}',fontWeight: FontWeight.w500,fontSize: 12,color: AppColor.greyColor,),
                                trailing:_trailingButton(onTap: (){
                                  KHomeBottomSheet.addPhysicalActivity(context);
                                }),
                                contentPadding: EdgeInsets.zero,
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: kNumberButton(
            onPressed: () {Get.back();},
            itemCount: '0',
            btnText: AppStrings.addActivity,
          ).paddingSymmetric(horizontal: 5.w,vertical: 3.h),
        );
      },
    );
  }
  Widget _trailingButton({required Function() onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.startGradient)
          ),
          child: const Icon(Icons.add,color: AppColor.endGradient,)
      ),
    );
  }
}
