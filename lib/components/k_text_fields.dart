
import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/controller/auth_controller.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:pinput/pinput.dart';

class GetTextField extends StatelessWidget {
  final BuildContext context;
  final String? hintText;
  final String? prefixIcon;
  final IconData? suffixIcon;

  final String? Function(String?)? validator;
  final Function()? suffixOnTap;
  final Function()? fieldOnTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obSecureText;
  final bool? readOnly;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  const GetTextField({super.key,
    required this.context,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.obSecureText,
    this.suffixOnTap,
    this.onChanged,
    this.focusNode,
    this.fieldOnTap,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly !=null ?true:false,
      validator: validator,
      controller: controller,
      cursorColor: AppColor.greyColor,
      maxLines: 1,
      style: kTextStyle( fontSize: 15.0,fontWeight: FontWeight.w400),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction??TextInputAction.next,
      obscureText: obSecureText??true,
      onTapOutside: (event) {context.dismissKeyBoard();},
      onChanged: onChanged,
      focusNode: focusNode,
      onTap: fieldOnTap,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child:prefixIcon!=null? showSvgIconWidget(iconPath: prefixIcon!,height: 25,width: 25):null,
        ),
        prefixIconConstraints: const BoxConstraints(
            maxHeight: 25.0,
            maxWidth: 36.0
        ),
        suffixIconConstraints: const BoxConstraints(
            maxHeight: 25.0,
            maxWidth: 36.0
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
            color: AppColor.greyColor,
            size: 20,
          ),
          onPressed: suffixOnTap,
        )
            : null,
       contentPadding: const EdgeInsets.all( 15),
        hintStyle: kTextStyle(color: AppColor.greyColor, fontSize: 15.0,fontWeight: FontWeight.w400),
        filled: true,
        isDense: true,
        fillColor: Colors.transparent,
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color:AppColor.greyColor, width: 1.0),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color: AppColor.greyColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const  BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const  BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController? controller;
  final String? prefixText;
  final String? prefixIcon;
  final String? suffixText;
  final IconData? suffixTextIcon;
  final String? hintText;
  final Color? color;
  final Color? borderColor;
  final TextDirection? textDirection;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final double? fieldBorderRadius;
  final bool? enabled;


  const CustomTextField({super.key,
    required this.context,
    this.controller,
    this.prefixText,
    this.prefixIcon,
    this.suffixText,
    this.color,
    this.borderColor,
    this.textDirection,
    this.hintText,
    this.maxLines,
    this.textInputType,
    this.textInputAction,
    this.fieldBorderRadius,
    this.suffixTextIcon,
    this.enabled,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.greyColor,
      maxLines: maxLines?? 1,
      style: kTextStyle(),
      keyboardType: textInputType?? TextInputType.number,
      textInputAction: textInputAction?? TextInputAction.next,
      onTapOutside: (event) {context.dismissKeyBoard();},
      textDirection: textDirection!=null? TextDirection.rtl:TextDirection.ltr,
      enabled: enabled,
      decoration: InputDecoration(
        prefixIcon:  Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 10),
          child: prefixText != null
              ? Text(prefixText!,style: kTextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColor.greyColor),)
              : prefixIcon!=null? showSvgIconWidget(iconPath:  prefixIcon!):null,),
        suffixIcon: suffixText!= null?Padding(
          padding: const EdgeInsets.only(right: 18.0,left: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(suffixText!,style: kTextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: AppColor.greyColor),),
              if(suffixTextIcon !=null) Icon(suffixTextIcon)
            ],
          ),
        ):null,
        hintText: hintText??'',
        hintStyle: kTextStyle(color: AppColor.greyColor, fontSize: 16.0,fontWeight: FontWeight.w400),
        hintTextDirection: textDirection!=null? TextDirection.rtl:TextDirection.ltr,
        prefixIconConstraints: const BoxConstraints(maxHeight: 25.0),
        suffixIconConstraints: const BoxConstraints(maxHeight: 25.0,),
        filled: true,
        isDense: true,
        fillColor: color?? AppColor.lightGreyColor,
        contentPadding: const EdgeInsets.all(17),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldBorderRadius??12),
          borderSide:  BorderSide(color: borderColor?? Colors.transparent),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldBorderRadius??12),
          borderSide: BorderSide(color: borderColor??Colors.transparent,),
        ),
      ),
    );
  }
}


class PinCodeFields extends StatefulWidget {
  final AuthController controller;
  const PinCodeFields({super.key, required this.controller});

  @override
  State<PinCodeFields> createState() => _PinCodeFieldsState();
}
class _PinCodeFieldsState extends State<PinCodeFields> {
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    focusNode = FocusNode();

  }

  @override
  void dispose() {
    // authController.pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final defaultPinTheme = PinTheme(
      width: 65,
      height: 60,
      textStyle:  primaryTextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColor.whiteColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 4,
              controller: widget.controller.pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) =>  const SizedBox(width: 12),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1,
                    height: 30,
                    color: AppColor.greyColor,
                  ),
                ],
              ),
              followingPinTheme:  defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.lightGreyBorder),
                ),
              ),
              disabledPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.greyColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  gradient: AppColor.primaryGradient,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.transparent),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

