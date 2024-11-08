import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:get/get.dart';

class KLoading {
  static showProcess() {
    Get.context!.dismissKeyBoard();

    return Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: PopScope(
          canPop: false,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: const ColoredBox(
                color: AppColor.whiteColor,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ProgressIndicatorCustom(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static stopProcess() {
    if (Get.isDialogOpen == true) {
      Get.context!.dismissKeyBoard();
      Get.back();
    }
  }
}

class ProgressIndicatorCustom extends StatelessWidget {
  const ProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final double indicatorSize = MediaQuery.of(context).size.width * 0.08;

    return SizedBox(
      width: indicatorSize,
      height: indicatorSize,
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              color: AppColor.primaryColor,
              radius: indicatorSize / 2, // Adjust the radius to match size
            )
          : CircularProgressIndicator(
              color: AppColor.primaryColor,
              strokeWidth: indicatorSize * 0.1, // Adjust stroke width
            ),
    );
  }
}
