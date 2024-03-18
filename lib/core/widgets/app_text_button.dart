import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AppTextButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.kRadius8))),
        backgroundColor: const MaterialStatePropertyAll(AppColors.mainYellow),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          )
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(double.maxFinite, 56)
        ),
        elevation: MaterialStateProperty.all(15),
        shadowColor: MaterialStateProperty.all(AppColors.semiYellow),
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: TextStyles.font16Black700Weight,),
    );
  }
}

class AppElevatedTextedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const AppElevatedTextedButton({super.key, required this.buttonText, required this.onPressed, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}

