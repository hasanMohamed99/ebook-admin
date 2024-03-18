import 'package:flutter/material.dart';
import '../theming/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(color: AppColors.mainYellow,minHeight: 5,);
  }
}
