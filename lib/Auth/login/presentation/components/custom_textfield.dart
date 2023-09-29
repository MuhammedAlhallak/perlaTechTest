import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/values_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.onChanged,
      this.validator,
      this.controller,
      this.textInputType,
      this.prefixIcon});
  final String? hintText;
  final String? prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        fillColor: sl<ColorsManager>().textFieldBackground,
        filled: true,
        hintText: widget.hintText ?? '',
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 12.w),
          child: widget.prefixIcon != null
              ? SvgPicture.asset(
                  widget.prefixIcon!,
                  width: AppSize.s24.w,
                  height: AppSize.s24.w,
                  fit: BoxFit.scaleDown,
                  color: sl<ColorsManager>().iconColor, //grey
                )
              : const SizedBox(),
        ),
        //     errorText: "Error text here"
      ),
      cursorColor: sl<ColorsManager>().primary,
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      this.hintText,
      this.onChanged,
      this.validator,
      this.prefixIcon,
      required this.suffixIcon});
  final String? hintText;
  final String? prefixIcon;
  final String suffixIcon;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visible,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        fillColor: sl<ColorsManager>().textFieldBackground,
        filled: true,
        prefixIcon: Padding(
          padding:
              EdgeInsets.only(left: AppPading.p16.w, right: AppPading.p12.w),
          child: widget.prefixIcon != null
              ? SvgPicture.asset(
                  widget.prefixIcon!,
                  width: AppSize.s24.w,
                  height: AppSize.s24.w,
                  fit: BoxFit.scaleDown,
                  color: sl<ColorsManager>().iconColor,
                )
              : const SizedBox(),
        ),

        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPading.p24.w),
          child: GestureDetector(
            child: visible == false
                ? SvgPicture.asset(
                    widget.suffixIcon,
                    width: AppSize.s22.w,
                    height: AppSize.s18.w,
                    fit: BoxFit.scaleDown,
                    color: sl<ColorsManager>().primary,
                  )
                : SvgPicture.asset(
                    widget.suffixIcon,
                    width: AppSize.s22.w,
                    height: AppSize.s18.w,
                    fit: BoxFit.scaleDown,
                    color: sl<ColorsManager>().grey,
                  ),
            onTap: () {
              setState(() {
                visible = !visible;
              });
            },
          ),
        ),
        hintText: widget.hintText ?? '',
        //     errorText: "Error text here"
      ),
      cursorColor: sl<ColorsManager>().primary,
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
