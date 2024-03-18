import 'package:ebook_task_admin/core/theming/colors.dart';
import 'package:ebook_task_admin/core/theming/styles.dart';
import 'package:ebook_task_admin/features/home/logic/rail_nav_cubit/rail_nav_cubit.dart';
import 'package:ebook_task_admin/features/home/logic/rail_nav_cubit/rail_nav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/rail_nav_bar.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<RailNavCubit>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainYellow,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Admin Dashboard',
                style: TextStyles.font22Black700Weight,
              ),
              const Spacer(),
              SizedBox(
                width: 300,
                child: TabBar(
                  indicatorColor: AppColors.black,
                  labelStyle: TextStyles.font16Black700Weight,
                  unselectedLabelColor: AppColors.white,
                  tabs: const [
                    Tab(
                      text: 'Mange Users',
                    ),
                    Tab(
                      text: 'Mange Books',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Row(
              children: [
                const RailNavBar(
                  leading: DrawerHeader(
                    child: Icon(Icons.supervised_user_circle_sharp),
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.pending),
                      label: Text('Pending Users'),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.verified_user),
                      label: Text('Accepted Users'),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ],
                ),
                BlocBuilder<RailNavCubit, RailNavState>(
                  builder: (context, state) => state.when(
                    railNavBarState: (page) => navCubit.userScreens[page],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const RailNavBar(
                  leading: DrawerHeader(
                    child: Icon(Icons.library_books),
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.add_box),
                      label: Text('Add Book'),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.menu_book_sharp),
                      label: Text('Manage Books'),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ],
                ),
                BlocBuilder<RailNavCubit, RailNavState>(
                  builder: (context, state) => state.when(
                    railNavBarState: (page) => navCubit.bookScreens[page],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
