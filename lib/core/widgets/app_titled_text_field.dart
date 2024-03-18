import 'package:flutter/material.dart';
import '../helpers/spacing.dart';
import '../theming/styles.dart';
import 'app_text_form_fields.dart';

class AppTitledTextField extends StatelessWidget {
  final bool? isPassword;
  final TextEditingController? countryCodeController;
  final TextDirection? textDirection;
  final String title;
  final String textFormHintText;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  const AppTitledTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.textFormHintText,
    this.isPassword = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.textDirection,
    this.validator,
    this.countryCodeController,
    this.textCapitalization,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return isPassword == true
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font16Black400Weight,
              ),
              const VerticalSpace(10),
              AppPasswordTextFormField(
                controller: controller,
                hintText: textFormHintText,
                onFieldSubmitted: onFieldSubmitted,
                focusNode: focusNode,
                textDirection: textDirection,
                validator: validator,
                textInputAction: textInputAction,
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font16Black400Weight,
              ),
              const VerticalSpace(10),
              AppTextFormField(
                controller: controller,
                hintText: textFormHintText,
                onFieldSubmitted: onFieldSubmitted,
                focusNode: focusNode,
                textDirection: textDirection,
                validator: validator,
                textCapitalization: textCapitalization,
                textInputAction: textInputAction,
              )
            ],
          );
  }
}
