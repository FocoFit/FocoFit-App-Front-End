import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/asset_utils.dart';

class ProfileSettingData {
  String? title;
  String? subTitle;
  String? iconPath;

  ProfileSettingData({this.title, this.subTitle, this.iconPath});
}

List<ProfileSettingData> profileSettingOnList = [
  ProfileSettingData(
    title: AppStrings.mySignature,
    iconPath: AppIcons.badgeIcon,
  ),
  ProfileSettingData(
    title: AppStrings.switchLanguage,
    iconPath: AppIcons.languageIcon,
  ),
  ProfileSettingData(
    title: AppStrings.privacyPolicies,
    iconPath: AppIcons.shieldIcon,
  ),
  ProfileSettingData(
    title: AppStrings.termsOfService,
    iconPath: AppIcons.termsIcon,
  ),
  ProfileSettingData(
    title: AppStrings.sourceOfRecommendations,
    iconPath: AppIcons.bookIcon,
  ),
  ProfileSettingData(
    title: AppStrings.sendEmailToSupport,
    iconPath: AppIcons.envelopeIcon,
  ),
];
