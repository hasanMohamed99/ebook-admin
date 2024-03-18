import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../ui/widgets/accepted_users_widget.dart';
import '../../ui/widgets/add_book_widget.dart';
import '../../ui/widgets/manage_books.dart';
import '../../ui/widgets/manage_books_widget.dart';
import '../../ui/widgets/manage_users.dart';
import '../../ui/widgets/pending_users_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'rail_nav_state.dart';

class RailNavCubit extends Cubit<RailNavState> {
  RailNavCubit() : super(const RailNavState.railNavBarState(page: 0));
  void changePage(int index) => emit(RailNavBarState(page: index));

  final List<Widget> userScreens = [
    const PendingUsersWidget(),
    const AcceptedUsersWidget(),
  ];

  final List<Widget> bookScreens = [
    const AddBookWidget(),
    const ManageBooksWidget(),
  ];

  final List<Widget> mobileScreens = [
    const ManageUsers(),
    const ManageBooks(),
  ];

  final List mobileScreensAppbar = [
    AppBar(
      title: Text(
        'Users',
        style: TextStyles.font20Black700Weight,
      ),
      bottom: TabBar(
        indicatorColor: AppColors.mainYellow,
        labelStyle: TextStyles.font16Black700Weight,
        unselectedLabelColor: AppColors.black,
        physics: const NeverScrollableScrollPhysics(),
        tabs: const [
          Tab(
            text: 'Pending Users',
          ),
          Tab(
            text: 'Accepted Books',
          ),
        ],
      ),
    ),
    AppBar(
      title: Text(
        'Books',
        style: TextStyles.font20Black700Weight,
      ),
    ),
  ];
}
