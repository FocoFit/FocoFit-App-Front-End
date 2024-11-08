import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FastingController extends GetxController {
  final FixedExtentScrollController hourController = FixedExtentScrollController();
  final FixedExtentScrollController minController = FixedExtentScrollController();

  RxInt selectedFasting= (-1).obs;
  final RxInt selectHour = 1.obs;
  final RxInt selectMin = 1.obs;
}