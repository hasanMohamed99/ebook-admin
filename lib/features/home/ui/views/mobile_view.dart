import 'package:ebook_task_admin/core/helpers/extensions.dart';
import 'package:ebook_task_admin/features/home/logic/rail_nav_cubit/rail_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../logic/home_cubit.dart';
import '../../logic/rail_nav_cubit/rail_nav_state.dart';
import '../widgets/add_book_widget.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<RailNavCubit>();
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<RailNavCubit, RailNavState>(
        builder: (context, state) {
          return Scaffold(
            appBar: navCubit.mobileScreensAppbar[state.page],
            body: navCubit.mobileScreens[state.page],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.page,
              onTap: (value) => navCubit.changePage(value),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.manage_accounts),
                  label: 'Manage Users',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_outlined),
                  label: 'Manage Books',
                ),
              ],
            ),
            floatingActionButton: Visibility(
              visible: state.page==1,
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => BlocProvider(
                      create: (_) => getIt<HomeCubit>(),
                      child: AlertDialog(
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                // homeCubit.deleteBook(id: book.id);
                                // context.pop();
                              },
                              child: const Text('Confirm')),
                          ElevatedButton(
                              onPressed: () => context.pop(),
                              child: const Text('Cancel'))
                        ],
                        title: const Text('Modify Book'),
                        contentPadding: const EdgeInsets.all(20),
                        content: const AddBookMobileWidget(),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Book'),
              ),
            ),
          );
        },
      ),
    );
  }
}
