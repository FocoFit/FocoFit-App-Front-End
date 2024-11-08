import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/enums.dart';
import 'package:get/get.dart';


class KHomeData {
  String title;
  String iconPath;
  HomeItemType? type;

  KHomeData({
    required this.title,
    required this.iconPath,
    this.type,
  });
}

 RxList<KHomeData> homeDataList= [
  KHomeData(
    title: AppStrings.breakFast,
    iconPath: AppImages.breakfastImg,
    type: HomeItemType.breakFast,
  ),
  KHomeData(
    title: AppStrings.lunch,
    iconPath: AppImages.lunchImg,
    type: HomeItemType.lunch,
  ),
  KHomeData(
    title: AppStrings.toHaveLunch,
    iconPath: AppImages.toLunchImg,
    type: HomeItemType.toHaveLunch,
  ),
  KHomeData(
    title: AppStrings.snacks,
    iconPath: AppImages.snackImg,
    type: HomeItemType.snacks,
  ),
  KHomeData(
    title: AppStrings.physicalActivity,
    iconPath: AppImages.physicalActivityImg,
    type: HomeItemType.physicalActivity,
  ),
  KHomeData(
    title: AppStrings.water,
    iconPath: AppImages.waterBotelImg,
    type: HomeItemType.water,
  ),
  KHomeData(
    title: AppStrings.weight,
    iconPath: AppImages.weightImg,
    type: HomeItemType.breakFast,
  ),
].obs;

RxList subscriptionList= [
 AppStrings.addFreeExperience,
  AppStrings.fullAccessToPremiumFeatures,
  AppStrings.unlimitedFastingPlans,
    AppStrings.advanceTrackingTool,
  AppStrings.personalizedInsightsRecommendations,
  AppStrings.priorityCustomerSupport,
].obs;