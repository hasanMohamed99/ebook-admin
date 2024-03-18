import 'package:flutter/material.dart';

import '../helpers/constants.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final String hintText;
  final TextInputType? textInputType;
  final bool? isPhoneNumber;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText,
    this.textInputType,
    this.isPhoneNumber,
    this.onFieldSubmitted,
    this.focusNode,
    this.textDirection,
    this.validator,
    this.textCapitalization,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14.5),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainYellow, width: 1.3),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.kRadius8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray, width: 1.3),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.kRadius8)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1.3),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.kRadius8)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1.3),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.kRadius8)),
        ),
        hintStyle: TextStyles.font14Gray400Weight,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: AppColors.white,
        filled: true,
        hoverColor: AppColors.transparentWhite
      ),

      cursorColor: AppColors.mainYellow,
      obscureText: isObscureText ?? false,
      style: TextStyles.font16Black400Weight,
      keyboardType: textInputType,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textDirection: textDirection,
      validator: validator,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textInputAction: textInputAction,
    );
  }
}

class AppPasswordTextFormField extends StatefulWidget {
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String hintText;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  const AppPasswordTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onFieldSubmitted,
    this.focusNode,
    this.textDirection,
    this.validator,
    this.textInputAction,
  });

  @override
  State<AppPasswordTextFormField> createState() =>
      _AppPasswordTextFormFieldState();
}

class _AppPasswordTextFormFieldState extends State<AppPasswordTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14.5),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainYellow, width: 1.3),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.kRadius8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray, width: 1.3),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.kRadius8)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1.3),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.kRadius8)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1.3),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.kRadius8)),
        ),
        hintStyle: TextStyles.font14Gray400Weight,
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.lock, color: AppColors.black),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: Icon(
            isObscure == true ? Icons.visibility_off : Icons.visibility,
            color: AppColors.black,
          ),
        ),
        fillColor: AppColors.white,
        filled: true,
        hoverColor: AppColors.transparentWhite,
      ),
      cursorColor: AppColors.mainYellow,
      obscureText: isObscure,
      style: TextStyles.font14Black500Weight,
      keyboardType: TextInputType.visiblePassword,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textDirection: widget.textDirection,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
    );
  }
}
