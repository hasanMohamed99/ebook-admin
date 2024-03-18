import 'package:flutter/material.dart';

import '../theming/colors.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  const AppIconButton({super.key, required this.onPressed, required this.icon, this.backgroundColor, this.borderSide});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: onPressed,
      icon: icon,
      style: OutlinedButton.styleFrom(
        side: borderSide ?? const BorderSide(color: AppColors.lightGray),
        backgroundColor:backgroundColor,
      ),
    );
  }
}