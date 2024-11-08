import 'package:flutter/material.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget kTextButton({
  Color? color,
  Function()? onPressed,
  required String btnText,
  Widget? widget,
  Color? textColor,
  Color? borderColor,
  double? height,
  double? width,
  double? borderRadius,
  double? fontSize,
  double? padding,
  bool useGradient = false,
  Gradient? gradient,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: height != null ? height.h : 7.h,
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: padding ?? 15),
      decoration: BoxDecoration(
        gradient: useGradient ? gradient ?? AppColor.primaryGradient : null,
        color: useGradient ? null : (color ?? AppColor.primaryColor),
        border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
        borderRadius:
            BorderRadius.circular(borderRadius != null ? borderRadius.h : 26.h),
      ),
      child: widget ??
          Text(
            btnText,
            textAlign: TextAlign.center,
            style: kTextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: textColor ?? AppColor.whiteColor),
          ),
    ),
  );
}


class KOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Function() onTap;
  final String btnText;
  final double? fontSize;
  final double? height;
  final double? width;
  final Gradient? textGradient;

  KOutlineButton({
    super.key,
    required this.onTap,
    required this.btnText,
    required Gradient gradient,
    this.textGradient,
    this.height,
    this.width,
    this.fontSize,
  }) : _painter =
            _GradientPainter(strokeWidth: 1, radius: 36, gradient: gradient);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _painter,
        child: Container(
          alignment: Alignment.center,
          height: height != null ? height?.h : 7.h,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: width,
          child: GradientText(
            onTextTap: onTap,
            text: btnText,
            gradient: textGradient ?? AppColor.primaryGradient,
            style: kTextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor),
          ),
        ),
      ),
    );
  }
}

Widget kNumberButton({
  Color? color,
  Function()? onPressed,
  required String btnText,
  required String itemCount,
  Color? textColor,
  Color? borderColor,
  double? height,
  double? width,
  double? borderRadius,
  double? padding,
  bool useGradient = false,
  Gradient? gradient,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      alignment: Alignment.center,
      height: height != null ? height.h : 7.h,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: padding ?? 15),
      decoration: BoxDecoration(
        gradient: useGradient ? gradient ?? AppColor.primaryGradient : null,
        color: useGradient ? null : (color ?? AppColor.primaryColor),
        border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius ?? 32),
      ),
      child: Row(
        children: [
          const Spacer(),
          KText(
              text: btnText,
              textAlign: TextAlign.center,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: textColor ?? AppColor.whiteColor),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(32),
            ),
            child: KText(
                text: itemCount, fontSize: 15, fontWeight: FontWeight.w700),
          )
        ],
      ),
    ),
  );
}

Widget kSocialButton(
    {final Function()? onTap, final String? btnText, final String? imgPath}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 6.h,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: const EdgeInsets.only(left: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: AppColor.greyColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imgPath!),
            height: 30,
            width: 30,
          ),
          const Spacer(),
          KText(text: btnText!, fontWeight: FontWeight.w500, fontSize: 16),
          const Spacer(),
        ],
      ),
    ),
  );
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient})
      : strokeWidth = strokeWidth,
        radius = radius,
        gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
