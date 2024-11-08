import 'package:flutter/material.dart';
import 'package:focofit/components/k_buttons.dart';
import 'package:focofit/components/k_check_box.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationSetting extends StatelessWidget {
   NotificationSetting({super.key});
  final RxBool _enableNotification= false.obs;
  final RxBool _eatingReminder= false.obs;
  final RxBool _waterReminder= false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: kAppBar(
          onTap: (){
            Navigator.pop(context);
          },
          title: AppStrings.notifications,
          shadowColor: AppColor.blackColor.withOpacity(0.4)
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          children: [
            CustomSwitchTile(
              value: _enableNotification,
              onChanged: (v) {
                _enableNotification.value = v;
              },
              title: AppStrings.enableAllNotifications,
              fontSize: 16,
            ),
            2.ySpace,
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.lightGreyBorder),
                  boxShadow: const [
                    AppColor.shadow
                  ]
              ),
              child: Column(children: [
                CustomSwitchTile(
                  value: _eatingReminder,
                  onChanged: (v) {
                    _eatingReminder.value = v;
                  },
                  title: AppStrings.mealEatingReminder,
                  fontSize: 16,
                ),
                const Divider(color: AppColor.lightGreyBorder),
                ListTile(
                  title: KText(text:  AppStrings.breakFast,fontWeight: FontWeight.w500),
                  subtitle: const Divider( color: AppColor.lightGreyBorder),
                  trailing: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.lightGreyBorder)
                    ),
                    child: const KText(text: '08:00',fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: KText(text:  AppStrings.lunch,fontWeight: FontWeight.w500),
                  subtitle: const Divider( color: AppColor.lightGreyBorder),
                  trailing: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: const KText(text: '08:00',fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: KText(text:  AppStrings.toHaveLunch,fontWeight: FontWeight.w500),
                  subtitle: const Divider( color: AppColor.lightGreyBorder),
                  trailing: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.lightGreyBorder)
                    ),
                    child: const KText(text: '08:00',fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: KText(text:  AppStrings.snacks,fontWeight: FontWeight.w500),
                  subtitle: const Divider( color: AppColor.lightGreyBorder),
                  trailing: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.lightGreyBorder)
                    ),
                    child: const KText(text: '08:00',fontWeight: FontWeight.w500),
                  ),
                ),
              ],),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.lightGreyBorder),
                  boxShadow: const [
                    AppColor.shadow
                  ]
              ),
              child: Column(children: [
                CustomSwitchTile(
                  value: _waterReminder,
                  onChanged: (v) {
                    _waterReminder.value = v;
                  },
                  title: AppStrings.drinkWaterReminder,
                ),
                Divider(color: AppColor.greyColor.withOpacity(0.5),),
                ListTile(
                  title: KText(text: AppStrings.rememberEvery,fontWeight: FontWeight.w500),
                  subtitle: const Divider( color: AppColor.lightGreyBorder),
                  trailing: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.lightGreyBorder)
                    ),
                    child: const  KText(text: '6 horas',fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: KText(text: AppStrings.rememberFrom,fontWeight: FontWeight.w500),
                  subtitle: const Divider( color: AppColor.lightGreyBorder),
                  trailing: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: const KText(text: '08:00',fontWeight: FontWeight.w500,),
                  ),
                ),
              ],),
            ),
          ],
        ),
      ),

      bottomNavigationBar: kTextButton(
        onPressed: (){},
        btnText: AppStrings.save,
        useGradient: true,
      ).paddingSymmetric(horizontal: 4.w,vertical: 3.h),
    );
  }
}
// Stack(
// children: [
// Container(
// color: Colors.lightBlue,
// alignment: Alignment.center,
// height: 290,
// width: 240,
// child: Stack(
// children: [
// Container(
// height: 250,
// width: 200,
// margin: const EdgeInsets.symmetric(vertical: 15),
// decoration: BoxDecoration(
// color: AppColor.whiteColor,
// borderRadius: BorderRadius.circular(10),
// border: Border.all(color: AppColor.lightGreyBorder),
// image: DecorationImage(image: AssetImage(AppImages.recipeImg),fit: BoxFit.cover),
// boxShadow: const [
// AppColor.shadow
// ]
// ),
// ),
// Positioned(
// top: 0,
// left: 0,
// child: Container(
// height: 50,
// width: 50,
// decoration: BoxDecoration(
// color: Colors.red,
// shape: BoxShape.circle
// ),
// ),
// )
// ],
// ),
// ),
// ],
// ),