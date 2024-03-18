import 'package:ebook_task_admin/core/helpers/extensions.dart';
import 'package:ebook_task_admin/core/theming/colors.dart';
import 'package:ebook_task_admin/features/home/data/models/home_user_response.dart';
import 'package:ebook_task_admin/features/home/data/models/user_updated_data_request.dart';
import 'package:ebook_task_admin/features/home/logic/home_cubit.dart';
import 'package:ebook_task_admin/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theming/styles.dart';

class UserCard extends StatelessWidget {
  final HomeUserResponse user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Card(
      elevation: 0,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.transparent),
      ),
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.person_pin, size: 70),
            FittedBox(
              child: Text(
                user.name,
                style: TextStyles.font18Black700Weight,
              ),
            ),
            FittedBox(
              child: Text(
                user.email,
                style: TextStyles.font16Black700Weight,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: TextButton(
                    onPressed: () => homeCubit
                      ..updateUserData(
                        userUpdatedDataRequest: UserUpdatedDataRequest(
                          id: user.id,
                          name: user.name,
                          email: user.email,
                          authId: user.authId,
                          status: 'accepted',
                        ),
                      )
                      ..sendConfirmEmail(email: user.email),
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.green),
                    ),
                    child:
                        Text('Accept', style: TextStyles.font14White400Weight),
                  ),
                ),
                FittedBox(
                  child: TextButton(
                    onPressed: () =>
                        homeCubit.deleteUser(id: user.id, authId: user.authId),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppColors.red),
                    ),
                    child: Text('Deny', style: TextStyles.font14White400Weight),
                  ),
                ),
              ],
            ),
            BlocListener<HomeCubit, HomeState>(
              listenWhen: (previous, current) =>
                  current is Loading || current is Success || current is Error,
              listener: (context, state) {
                state.whenOrNull(
                  loading: () {},
                  success: (response) {},
                  error: (error) {
                    showDialog(
                      context: context,
                      builder: (context) => FittedBox(
                        child: AlertDialog(
                          backgroundColor: AppColors.red,
                          title: Text(
                            'Login Failed',
                            style: TextStyles.font20White700Weight,
                          ),
                          content: Text(error,
                              style: TextStyles.font14White400Weight),
                          insetPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 4),
                        ),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 3))
                        .then((value) => context.pop());
                  },
                );
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAcceptedCard extends StatelessWidget {
  final HomeUserResponse user;
  const UserAcceptedCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Card(
      elevation: 0,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.transparent),
      ),
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.person_pin, size: 70),
            FittedBox(
              child: Text(
                user.name,
                style: TextStyles.font18Black700Weight,
              ),
            ),
            FittedBox(
              child: Text(
                user.email,
                style: TextStyles.font16Black700Weight,
              ),
            ),
            FittedBox(
              child: TextButton(
                onPressed: () => showDialog(context: context, builder: (context) => AlertDialog(
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          homeCubit.deleteUser(
                              id: user.id, authId: user.authId);
                          context.pop();
                        },
                        child: const Text('Confirm')),
                    ElevatedButton(
                        onPressed: () => context.pop(),
                        child: const Text('Cancel'))
                  ],
                  title: const Text('Delete User'),
                  contentPadding: const EdgeInsets.all(20),
                  content: const Text('Are you sure to delete this user?'),
                )),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.red),
                ),
                child: Text('Delete', style: TextStyles.font14White400Weight),
              ),
            ),
            BlocListener<HomeCubit, HomeState>(
              listenWhen: (previous, current) =>
                  current is Loading || current is Success || current is Error,
              listener: (context, state) {
                state.whenOrNull(
                  loading: () {},
                  success: (response) {},
                  error: (error) {
                    showDialog(
                      context: context,
                      builder: (context) => FittedBox(
                        child: AlertDialog(
                          backgroundColor: AppColors.red,
                          title: Text(
                            'Login Failed',
                            style: TextStyles.font20White700Weight,
                          ),
                          content: Text(error,
                              style: TextStyles.font14White400Weight),
                          insetPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 4),
                        ),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 3))
                        .then((value) => context.pop());
                  },
                );
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserCardMobile extends StatelessWidget {
  final HomeUserResponse user;
  const UserCardMobile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Card(
      elevation: 0,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.transparent),
      ),
      color: AppColors.white,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(child: Icon(Icons.person_pin, size: 70)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      user.name,
                      style: TextStyles.font18Black700Weight,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      user.email,
                      style: TextStyles.font16Black700Weight,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FittedBox(
                    child: TextButton(
                      onPressed: () => homeCubit
                        ..updateUserData(
                          userUpdatedDataRequest: UserUpdatedDataRequest(
                            id: user.id,
                            name: user.name,
                            email: user.email,
                            authId: user.authId,
                            status: 'accepted',
                          ),
                        )
                        ..sendConfirmEmail(email: user.email),
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.green),
                      ),
                      child: Text('Accept',
                          style: TextStyles.font14White400Weight),
                    ),
                  ),
                  FittedBox(
                    child: TextButton(
                      onPressed: () => homeCubit.deleteUser(
                          id: user.id, authId: user.authId),
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.red),
                      ),
                      child:
                          Text('Deny', style: TextStyles.font14White400Weight),
                    ),
                  ),
                ],
              ),
            ),
            BlocListener<HomeCubit, HomeState>(
              listenWhen: (previous, current) =>
                  current is Loading || current is Success || current is Error,
              listener: (context, state) {
                state.whenOrNull(
                  loading: () {},
                  success: (response) {},
                  error: (error) {
                    showDialog(
                      context: context,
                      builder: (context) => FittedBox(
                        child: AlertDialog(
                          backgroundColor: AppColors.red,
                          title: Text(
                            'Login Failed',
                            style: TextStyles.font20White700Weight,
                          ),
                          content: Text(error,
                              style: TextStyles.font14White400Weight),
                          insetPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 4),
                        ),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 3))
                        .then((value) => context.pop());
                  },
                );
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAcceptedMobile extends StatelessWidget {
  final HomeUserResponse user;
  const UserAcceptedMobile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Card(
      elevation: 0,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.transparent),
      ),
      color: AppColors.white,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 15,
              child: Icon(Icons.person_pin, size: 70),
            ),
            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      user.name,
                      style: TextStyles.font18Black700Weight,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      user.email,
                      style: TextStyles.font16Black700Weight,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 10,
              child: FittedBox(
                child: TextButton(
                  onPressed: () => showDialog(context: context, builder: (context) => AlertDialog(
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            homeCubit.deleteUser(
                                id: user.id, authId: user.authId);
                            context.pop();
                          },
                          child: const Text('Confirm')),
                      ElevatedButton(
                          onPressed: () => context.pop(),
                          child: const Text('Cancel'))
                    ],
                    title: const Text('Delete User'),
                    contentPadding: const EdgeInsets.all(20),
                    content: const Text('Are you sure to delete this user?'),
                  )),
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColors.red),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Text('Delete', style: TextStyles.font14White400Weight),
                ),
              ),
            ),
            const Spacer(flex: 1),
            BlocListener<HomeCubit, HomeState>(
              listenWhen: (previous, current) =>
                  current is Loading || current is Success || current is Error,
              listener: (context, state) {
                state.whenOrNull(
                  loading: () {},
                  success: (response) {},
                  error: (error) {
                    showDialog(
                      context: context,
                      builder: (context) => FittedBox(
                        child: AlertDialog(
                          backgroundColor: AppColors.red,
                          title: Text(
                            'Login Failed',
                            style: TextStyles.font20White700Weight,
                          ),
                          content: Text(error,
                              style: TextStyles.font14White400Weight),
                          insetPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 4),
                        ),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 3))
                        .then((value) => context.pop());
                  },
                );
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
