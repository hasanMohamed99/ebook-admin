import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/user_card.dart';
import '../../data/models/home_user_response.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class ManageUsers extends StatelessWidget {
  const ManageUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Center(
      child: TabBarView(children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            ),
            success: (homeUsers) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: StreamBuilder(
                stream: homeCubit.getPendingUser(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        VerticalSpace(5),
                        LoadingWidget(),
                      ],
                    );
                  } else if (homeUsers.isEmpty) {
                    return const Center(child: Text('No Pending Users'));
                  } else if (snapshot.hasError) {
                    return const Center(
                      child:
                      Text('Something went wrong please, try again later.'),
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) => UserCardMobile(
                      user: HomeUserResponse(
                        id: homeUsers[index]['id'],
                        name: homeUsers[index]['name'],
                        email: homeUsers[index]['email'],
                        authId: homeUsers[index]['auth_id'],
                      ),
                    ),
                    itemCount: homeUsers.length,
                  );
                },
              ),
            ),
            error: (message) => Center(
              child: FittedBox(child: Text(message, maxLines: 3, overflow: TextOverflow.visible)),
            ),
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: LoadingWidget(),
                  )
                ],
              ),
            ),
            success: (homeUsers) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: StreamBuilder(
                stream: homeCubit.getAcceptedUser(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        VerticalSpace(10),
                        LoadingWidget(),
                      ],
                    );
                  } else if (homeUsers.isEmpty) {
                    return const Center(child: Text('No Accepted Users'));
                  } else if (snapshot.hasError) {
                    return const Center(
                        child:
                        Text('Something went wrong please, try again later.'));
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) => UserAcceptedMobile(
                      user: HomeUserResponse(
                        id: homeUsers[index]['id'],
                        name: homeUsers[index]['name'],
                        email: homeUsers[index]['email'],
                        authId: homeUsers[index]['auth_id'],
                      ),
                    ),
                    itemCount: homeUsers.length,
                  );
                },
              ),
            ),
            error: (message) => Center(
              child: Text(message),
            ),
          ),
        ),
      ]),
    );
  }
}
