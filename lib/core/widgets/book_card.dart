import 'package:ebook_task_admin/core/helpers/extensions.dart';
import 'package:ebook_task_admin/core/helpers/spacing.dart';
import 'package:ebook_task_admin/core/theming/colors.dart';
import 'package:ebook_task_admin/features/home/data/models/book_response.dart';
import 'package:ebook_task_admin/features/home/logic/home_cubit.dart';
import 'package:ebook_task_admin/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/ui/widgets/add_book_widget.dart';
import '../di/dependency_injection.dart';
import '../theming/styles.dart';

class BookCard extends StatelessWidget {
  final BookResponse book;
  const BookCard({super.key, required this.book});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.network(
                book.imageLink,
                fit: BoxFit.fill,
                cacheHeight: 211,
                cacheWidth: 70,
              ),
            ),
            const HorizontalSpace(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.bookName,
                    style: TextStyles.font20Yellow700WeightElevated,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const VerticalSpace(10),
                  Text(
                    'By ${book.authorName}',
                    style: TextStyles.font18Black700Weight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const VerticalSpace(10),
                  Text(
                    book.category,
                    style: TextStyles.font16Black700Weight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      child: TextButton(
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
                                content: UpdateWidget(book: book),
                              ),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.blue),
                        ),
                        child: Text('Modify',
                            style: TextStyles.font14White400Weight),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    homeCubit.deleteBook(id: book.id);
                                    context.pop();
                                  },
                                  child: const Text('Confirm')),
                              ElevatedButton(
                                  onPressed: () => context.pop(),
                                  child: const Text('Cancel'))
                            ],
                            title: const Text('Delete Book'),
                            contentPadding: const EdgeInsets.all(20),
                            content:
                                const Text('Are you sure to delete this book?'),
                          ),
                        ),
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.red),
                        ),
                        child: Text('Delete',
                            style: TextStyles.font14White400Weight),
                      ),
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
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  success: (response) {},
                  error: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error),
                        backgroundColor: AppColors.red,
                      ),
                    );
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

class BookCardMobile extends StatelessWidget {
  final BookResponse book;
  const BookCardMobile({super.key, required this.book});

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
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image.network(
                  book.imageLink,
                  fit: BoxFit.fill,
                  cacheHeight: 200,
                  cacheWidth: 200,
                ),
              ),
              const HorizontalSpace(10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.bookName,
                      style: TextStyles.font20Yellow700WeightElevated,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const VerticalSpace(10),
                    Text(
                      'By ${book.authorName}',
                      style: TextStyles.font18Black700Weight,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const VerticalSpace(10),
                    Text(
                      book.category,
                      style: TextStyles.font16Black700Weight,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: TextButton(
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
                                  content: UpdateWidget(book: book),
                                ),
                              ),
                            );
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(AppColors.blue),
                          ),
                          child: Text('Modify',
                              style: TextStyles.font14White400Weight),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: TextButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      homeCubit.deleteBook(id: book.id);
                                      context.pop();
                                    },
                                    child: const Text('Confirm')),
                                ElevatedButton(
                                    onPressed: () => context.pop(),
                                    child: const Text('Cancel'))
                              ],
                              title: const Text('Delete Book'),
                              contentPadding: const EdgeInsets.all(20),
                              content:
                              const Text('Are you sure to delete this book?'),
                            ),
                          ),
                          style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(AppColors.red),
                          ),
                          child: Text('Delete',
                              style: TextStyles.font14White400Weight),
                        ),
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
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (response) {},
                    error: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    },
                  );
                },
                child: const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
