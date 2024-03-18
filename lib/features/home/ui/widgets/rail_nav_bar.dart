import 'package:ebook_task_admin/features/home/logic/rail_nav_cubit/rail_nav_cubit.dart';
import 'package:ebook_task_admin/features/home/logic/rail_nav_cubit/rail_nav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class RailNavBar extends StatelessWidget {
  final Widget? leading;
  final List<NavigationRailDestination> destinations;
  const RailNavBar({super.key, this.leading, required this.destinations});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RailNavCubit, RailNavState>(
      builder: (context, state) {
        return NavigationRail(
          extended: true,
          selectedIconTheme: const IconThemeData(color: AppColors.mainYellow),
          selectedLabelTextStyle: TextStyles.font16Yellow400WeightElevated,
          unselectedIconTheme: const IconThemeData(color: AppColors.black),
          unselectedLabelTextStyle: TextStyles.font16Black400Weight,
          indicatorColor: AppColors.transparent,
          useIndicator: false,
          leading: leading,
          destinations: destinations,
          selectedIndex: state.page,
          onDestinationSelected: (value) {
            context.read<RailNavCubit>().changePage(value);
          },
        );
      },
    );
  }
}
