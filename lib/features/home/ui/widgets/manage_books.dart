import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/book_card.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../data/models/book_response.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class ManageBooks extends StatelessWidget {
  const ManageBooks({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: LoadingWidget(),
              )
            ],
          ),
        ),
        success: (books) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: StreamBuilder(
            stream: homeCubit.getBooks(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Column(
                  children: [
                    VerticalSpace(5),
                    LoadingWidget(),
                  ],
                );
              } else if (books.isEmpty) {
                return const Center(child: Text('No Books'));
              } else if (snapshot.hasError) {
                return const Center(
                  child:
                  Text('Something went wrong please, try again later.'),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => BookCardMobile(
                  book: BookResponse(
                    id: books[index]['id'],
                    bookName: books[index]['name'],
                    authorName: books[index]['author'],
                    pdfLink: books[index]['pdf'],
                    imageLink: books[index]['image'],
                    category: books[index]['category'],
                    createdAt: books[index]['created_at'],
                  ),
                ),
                itemCount: books.length,
              );
            },
          ),
        ),
        error: (message) => Center(
          child: Text(message),
        ),
      ),
    );
  }
}
