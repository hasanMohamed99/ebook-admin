import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';


class DividerWidget extends StatelessWidget {
  final String title;
  const DividerWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 8,
          child: Divider(
            thickness: 1,
            color: AppColors.lightBlack,
          ),
        ),

        Expanded(
          flex: 10,
          child: Text(
            title,
            style: TextStyles.font14Black400Weight,
            textAlign: TextAlign.center,
          ),
        ),
        const Expanded(
          flex: 8,
          child: Divider(
            thickness: 1,
            color: AppColors.lightBlack,
          ),
        ),
      ],
    );
  }
}
