import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension CustomSizeBox on int {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}
extension SpaceXY on int {
  SizedBox get ySpace => SizedBox(height: toDouble().h);
  SizedBox get xSpace => SizedBox(width: toDouble().w);
}

extension DismisskeyBoard on BuildContext {
  void dismissKeyBoard(){
    FocusScope.of(this).unfocus();
  }
}
extension KeyboardVisibility on BuildContext {
  bool get isKeyboardVisible {
    return MediaQuery.of(this).viewInsets.bottom > 0;
  }
}