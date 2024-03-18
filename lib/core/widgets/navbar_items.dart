import 'package:ebook_task_admin/core/theming/styles.dart';
import 'package:ebook_task_admin/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

List<Widget> navbarItems = [
  AppElevatedTextedButton(buttonText: 'Mange Users', onPressed: (){}, textStyle: TextStyles.font16Yellow400WeightElevated),
  AppElevatedTextedButton(buttonText: 'Mange Books', onPressed: (){}, textStyle: TextStyles.font16Yellow400WeightElevated),
  AppElevatedTextedButton(buttonText: 'Logout', onPressed: (){}, textStyle: TextStyles.font16Black700Weight),
];
