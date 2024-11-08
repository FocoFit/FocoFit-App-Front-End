import 'package:flutter/material.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const KText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textDecoration,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: kTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight?? FontWeight.w400,
        color: color?? AppColor.blackColor,
        textDecoration: textDecoration?? TextDecoration.none,
      ),
    );
  }
}

TextStyle kTextStyle({double? fontSize, FontWeight? fontWeight,Color? color,TextDecoration? textDecoration}){
  return GoogleFonts.inter(
      textStyle: TextStyle(
        decoration:textDecoration?? TextDecoration.none,
        fontSize: fontSize!=null ? fontSize.sp: 16.sp,
        fontWeight: fontWeight??FontWeight.w400,
        color: color??Colors.black,
      )
  );
}




class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final Function()? onTextTap;
  const GradientText({
    super.key,
    required this.text,
    this.style,
    required this.gradient,
    this.onTextTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTextTap,
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Text(text, style: style),
      ),
    );
  }
}


TextStyle primaryTextStyle({double? fontSize, FontWeight? fontWeight,Color? color,TextDecoration? textDecoration}){
  return GoogleFonts.inter(
      textStyle: TextStyle(
        decoration:textDecoration?? TextDecoration.none,
        fontSize: fontSize?? 20,
        fontWeight: fontWeight??FontWeight.w300,
        color: color??Colors.black,
      )
  );
}