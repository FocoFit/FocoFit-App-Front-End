import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

AppBar kAppBar({
  final Function()? onTap,
  final Function()? trailingOnTap,
  final String? title,
  double? titleSize,
  final String? subTitle,
  final String? trailingIcon,
  final Color? shadowColor,
  final Color? trailingBorderColor,
  final Color? leadingBorderColor,
  final Color? leadingIconColor,
  final Color? trailingIconColor,
}) {
  return AppBar(
    leading: onTap != null
        ? GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Removed bottom/top and added symmetric margin
        padding: const EdgeInsets.only(left:  10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: leadingBorderColor ?? AppColor.blackColor),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: leadingIconColor ?? AppColor.blackColor,
          size: 20, // Adjust icon size if needed
        ),
      ),
    )
        : const SizedBox.shrink(),
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        title != null
            ? KText(
          text: title,
          fontSize: titleSize ?? 20,
          fontWeight: FontWeight.w600,
        )
            : const SizedBox.shrink(),
        subTitle != null
            ? KText(
          text: subTitle,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: AppColor.greyColor,
        )
            : const SizedBox.shrink(),
      ],
    ),
    centerTitle: true,
    actions: [
      trailingOnTap != null
          ? GestureDetector(
        onTap: trailingOnTap,
        child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: trailingBorderColor ?? AppColor.blackColor),
          ),
          child: showSvgIconWidget(
            onTap: trailingOnTap,
            iconPath: trailingIcon ?? AppIcons.settingIcon,
            color: trailingIconColor ?? AppColor.blackColor,
          ),
        ),
      )
          : const SizedBox.shrink(),
    ],
    leadingWidth: 60,
    scrolledUnderElevation: 0.0,
    elevation: shadowColor != null ? 5 : 0.0,
    backgroundColor: shadowColor != null ? AppColor.whiteColor : Colors.transparent,
    surfaceTintColor: shadowColor != null ? AppColor.whiteColor : Colors.transparent,
    shadowColor: shadowColor != null ? AppColor.blackColor.withOpacity(0.5) : Colors.transparent,
  );
}




AppBar kProfileAppBar({
  final Function()? onTileTap,
  final Function()? trailingOnTap,
  final String? imgPath,
  final String? title,
  final String? subTitle,
  final String? notificationCount,
}){
  return AppBar(
    leadingWidth: mQ.width,
    toolbarHeight: 90,
    backgroundColor: Colors.white,
    shadowColor: AppColor.blackColor.withOpacity(0.3),
    elevation: 5,
    surfaceTintColor: AppColor.whiteColor,
    leading: ListTile(
      onTap: onTileTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(imgPath!,),
      ),
      title: Text(title!),
      subtitle: Text(subTitle!),
      titleTextStyle: kTextStyle(fontSize: 16,fontWeight: FontWeight.w500),
      subtitleTextStyle: kTextStyle(fontWeight: FontWeight.w600,),
      trailing: notificationCount!=null
          ? Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: trailingOnTap,
            child: SizedBox(
                height: 50,
                width: 50,
                child: Center(child: showSvgIconWidget(iconPath: AppIcons.bellIcon,onTap: trailingOnTap))),
          ),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.whiteColor
            ),
            child: Text(notificationCount,style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
          )
        ],
      )
          : GestureDetector(
        onTap: trailingOnTap,
        child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.blackColor)),
          child: showSvgIconWidget(onTap: trailingOnTap, iconPath: AppIcons.settingIcon,color: AppColor.blackColor),
        ),
      ),
    ),
  );
}