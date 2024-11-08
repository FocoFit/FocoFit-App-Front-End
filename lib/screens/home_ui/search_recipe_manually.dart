import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_text_fields.dart';
import 'package:focofit/controller/home_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/screens/home_ui/create_diet_screens/create_diet_options.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/enums.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:focofit/widgets/k_bottom_sheets/home_bottom_sheets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchRecipeManually extends StatelessWidget {
  const SearchRecipeManually({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(tag: 'homeController'),
      builder: (controller) {
        return Scaffold(
          appBar: kAppBar(

            onTap: () => Get.back(),
            trailingOnTap: () => Get.to(() => const CreateDietOptions()),
            title: AppStrings.breakFast,
            titleSize: 18,
            subTitle: '0 ${AppStrings.kcal}',
            trailingIcon: AppIcons.plusIcon,
          ),
          body: DefaultTabController(
            length: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Column(
                children: [
                  /// Search container
                  CustomTextField(
                    context: context,
                    controller: controller.searchController,
                    prefixIcon: AppIcons.searchIcon,
                    hintText: AppStrings.whatDidYouEat,
                    fieldBorderRadius: 32,
                  ),
                  15.height,
                  _buildTabBar(),
                  10.height,
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildRecipeList(controller, RecipeTab.all),
                        _buildRecipeList(controller, RecipeTab.favorites),
                        _buildRecipeList(controller, RecipeTab.created),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context),
        );
      },
    );
  }

  Widget _buildTabBar() {
    return Container(
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
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        unselectedLabelStyle: kTextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w500,
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
    );
  }

  Widget _buildRecipeList(HomeController controller, RecipeTab tab) {
    return ListView.builder(
      itemCount: 16,
      itemBuilder: (context, index) {
        return ListTile(
          title: KText(text:AppStrings.sweetRice,
            fontWeight: FontWeight.w500,
          ),
          subtitle: _buildSubtitle(tab),
          trailing: _buildTrailingIcon(context),
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }

  Widget _buildSubtitle(RecipeTab tab) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KText(text:AppStrings.sweetRiceCalories,fontSize: 14, fontWeight: FontWeight.w500,color: AppColor.greyColor,),
        if (tab == RecipeTab.created) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.startGradient),
            ),
            child: GradientText(
              text: AppStrings.createdWithFocoFitPro,
              gradient: AppColor.primaryGradient,
              style: kTextStyle(fontSize: 12),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTrailingIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => KHomeBottomSheet.addCalories(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.startGradient),
        ),
        child: const Icon(
          Icons.add,
          color: AppColor.endGradient,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return kNumberButton(
      onPressed: () {
        Get.back();
        Get.back();
        },
      itemCount: '0',
      btnText: AppStrings.confirmAndSave,
    ).paddingSymmetric(horizontal: 5.w,vertical: 3.h);
  }
}


