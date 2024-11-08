///home screen water increment decrement

// Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// /// Decrement in ListWheelScrollView
// GestureDetector(
// onTap: () {
// // Decrement the selected index
// if (selectedWeightKg.value > 0) {
// selectedWeightKg.value--;
// kgController.animateToItem(
// selectedWeightKg.value,
// duration: const Duration(milliseconds: 300),
// curve: Curves.easeInOut,
// );
// }
// },
// child: Container(
// height: 4.5.h,
// width: 10.w,
// decoration: const BoxDecoration(
// gradient: AppColor.primaryGradient,
// shape: BoxShape.circle,
// ),
// child: const Icon(
// Icons.remove,
// color: AppColor.whiteColor,
// ),
// ),
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.2,
// width: MediaQuery.of(context).size.width * 0.15,
// child: ListWheelScrollView.useDelegate(
// controller: kgController,
// onSelectedItemChanged: (value) {
// selectedWeightKg.value = value;
// },
// itemExtent: 20,
// perspective: 0.006,
// diameterRatio: 1.6,
// physics: const FixedExtentScrollPhysics(),
// childDelegate: ListWheelChildBuilderDelegate(
// childCount: 120,
// builder: (context, index) {
// return Obx(
// () => Center(
// child: KText(
// text: index.toString(),
// fontSize: index == selectedWeightKg.value ? 16 : 15,
// fontWeight: index == selectedWeightKg.value
// ? FontWeight.w600
//     : FontWeight.w400,
// color: AppColor.greyColor,
// ),
// ),
// );
// },
// ),
// ),
// ),
// /// Increment in ListWheelScrollView
// GestureDetector(
// onTap: () {
// // Increment the selected index
// if (selectedWeightKg.value < 119) {
// selectedWeightKg.value++;
// kgController.animateToItem(
// selectedWeightKg.value,
// duration: const Duration(milliseconds: 300),
// curve: Curves.easeInOut,
// );
// }
// },
// child: Container(
// height: 4.5.h,
// width: 10.w,
// decoration: const BoxDecoration(
// gradient: AppColor.primaryGradient,
// shape: BoxShape.circle,
// ),
// child: const Icon(
// Icons.add,
// color: AppColor.whiteColor,
// ),
// ),
// ),
// ],
// ),


///wrap filtersheet
// Wrap(
// spacing: 1.w,
// runSpacing: 1.h,
// children: List.generate(dietList.length, (index) {
// return Obx(() => GestureDetector(
// onTap: () {
// recipeController.selectedDiet.value = index;
// },
// child: Container(
// alignment: Alignment.center,
// padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
//
// height: 4.h,
// decoration: BoxDecoration(
// border: Border.all(
// color: recipeController.selectedDiet.value == index
// ? AppColor.startGradient
//     : AppColor.lightGreyBorder,
// width: recipeController.selectedDiet.value == index ? 1.5 : 1,
// ),
// borderRadius: BorderRadius.circular(8),
// ),
// child: KText(
// text: dietList[index].toString(),fontWeight: FontWeight.w500,
// ),
// ),
// ));
// }),
// ),

///macroneutrients box
// Expanded(
// child: ListView.builder(
// itemCount: 3,
// itemBuilder: (context,index){
// return Obx(() {
// final bool isActive = !c.recalculateCalorieLimit.value;
// return Container(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
// margin: const EdgeInsets.symmetric(vertical: 10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// border: Border.all(color: isActive ? AppColor.greyBorder : AppColor.greyColor.withOpacity(0.4)),
// color: isActive ? Colors.white : AppColor.lightGreyColor,
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// KText(text: AppStrings.breakFast,
// fontSize: 16,
// fontWeight: FontWeight.w600,
// color: isActive ? Colors.black : Colors.grey,
//
// ),
// 15.height,
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// _macroDetailBox(isActive: isActive, text: '33', unit: '%'),
// _macroDetailBox(isActive: isActive, text: '45', unit: AppStrings.kcal),
// ],
// ),
// ],
// ),
// );
// });
// }),
// )
///widget macroneytruents
// Widget _macroDetailBox({required bool isActive,required String text,required String unit}){
//   return  Row(
//     children: [
//       Container(
//         padding: const EdgeInsets.symmetric(
//             horizontal: 15, vertical: 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//               color: isActive
//                   ? AppColor.greyBorder
//                   : AppColor.greyColor.withOpacity(0.4)),
//         ),
//         child:
//         KText(text: text,
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: isActive ? Colors.black : AppColor.greyColor,
//         ),
//       ),
//       5.width,
//       KText(text: unit,
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//         color: isActive ? Colors.black : AppColor.greyColor,
//       ),
//     ],
//   );
// }
