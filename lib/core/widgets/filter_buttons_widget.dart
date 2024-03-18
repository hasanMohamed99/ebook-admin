import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class FilterButtonsWidget extends StatefulWidget {
  final List<String> labels;
  const FilterButtonsWidget({super.key, required this.labels});

  @override
  State<FilterButtonsWidget> createState() => _FilterButtonsWidgetState();
}

class _FilterButtonsWidgetState extends State<FilterButtonsWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.labels.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: _selectedIndex == index
                    ? AppColors.mainYellow
                    : AppColors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  side: BorderSide(
                    style: BorderStyle.solid,
                    strokeAlign: 2,
                    color: _selectedIndex == index
                        ? AppColors.black
                        : AppColors.transparent,
                  ),
                ),
              ),
              onPressed: () => setState(() {
                _selectedIndex = index;
              }),
              child: FittedBox(
                child: Text(
                  widget.labels[index],
                  style: _selectedIndex == index
                      ? TextStyles.font16Black400Weight
                      : TextStyles.font16White500Weight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
