import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:ebook_task_admin/core/helpers/spacing.dart';
import 'package:ebook_task_admin/core/theming/colors.dart';
import 'package:ebook_task_admin/core/theming/styles.dart';
import 'package:ebook_task_admin/core/widgets/app_text_button.dart';
import 'package:ebook_task_admin/core/widgets/app_titled_text_field.dart';
import 'package:ebook_task_admin/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../data/models/book_response.dart';
import '../../logic/home_state.dart';

class AddBookWidget extends StatelessWidget {
  const AddBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Expanded(
      child: Form(
        key: homeCubit.bookFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: () => homeCubit.clearFields(),
                  child: Text(
                    'Clear fields',
                    style: TextStyles.font14Red500Weight,
                  ),
                ),
              ),
              const VerticalSpace(30),
              InkWell(
                onTap: () => homeCubit.pickImage(),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return DottedBorder(
                      borderPadding: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      color: AppColors.black,
                      strokeWidth: 3,
                      borderType: BorderType.RRect,
                      dashPattern: const [8, 4],
                      radius: const Radius.circular(8),
                      child: Card(
                        elevation: 0,
                        color: AppColors.transparent,
                        child: SizedBox(
                          height: 200,
                          width: 150,
                          child: homeCubit.webImage == null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                        Icons.image,
                                        size: 40,
                                      ),
                                      Text('Upload book cover',
                                          style: TextStyles
                                              .font14Yellow400WeightElevated)
                                    ],
                                  ),
                                )
                              : Image.memory(
                                  homeCubit.webImage ?? Uint8List(8),
                                  fit: BoxFit.fill,
                                  cacheWidth: 150,
                                  cacheHeight: 200,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const VerticalSpace(20),
              ElevatedButton(
                onPressed: () => homeCubit.pickPDF(),
                child: const Text('Upload pdf'),
              ),
              const VerticalSpace(5),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Text(homeCubit.pdfFile?.files.first.name ?? '');
                },
              ),
              const VerticalSpace(20),
              SizedBox(
                width: 300,
                child: AppTitledTextField(
                  controller: homeCubit.bookNameController,
                  title: 'Book name',
                  textFormHintText: 'Enter book name',
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              const VerticalSpace(20),
              SizedBox(
                width: 300,
                child: AppTitledTextField(
                  controller: homeCubit.authorController,
                  title: 'Author name',
                  textFormHintText: 'Enter author name',
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              const VerticalSpace(20),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: TextStyles.font16Black400Weight,
                    ),
                    const VerticalSpace(10),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14.5),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.mainYellow, width: 1.3),
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppConstants.kRadius8)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.lightGray, width: 1.3),
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppConstants.kRadius8)),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.red, width: 1.3),
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppConstants.kRadius8)),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.red, width: 1.3),
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppConstants.kRadius8)),
                          ),
                          hintStyle: TextStyles.font14Gray400Weight,
                          fillColor: AppColors.white,
                          filled: true,
                          hoverColor: AppColors.transparentWhite),
                      borderRadius: BorderRadius.circular(8),
                      value: homeCubit.categoryValue,
                      items: const [
                        DropdownMenuItem(
                            value: 'Horror', child: Text('Horror')),
                        DropdownMenuItem(
                            value: 'Fiction', child: Text('Fiction')),
                        DropdownMenuItem(
                            value: 'Historical Fiction',
                            child: Text('Historical Fiction')),
                        DropdownMenuItem(
                            value: 'Mystery', child: Text('Mystery')),
                        DropdownMenuItem(
                            value: 'Science Fiction',
                            child: Text('Science Fiction')),
                        DropdownMenuItem(
                            value: 'Fantasy', child: Text('Fantasy')),
                        DropdownMenuItem(
                            value: 'Romance', child: Text('Romance')),
                        DropdownMenuItem(
                            value: 'Adventure', child: Text('Adventure')),
                      ],
                      onChanged: (value) =>
                          homeCubit.categoryValue = value ?? '',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const VerticalSpace(40),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: 200,
                  child: AppTextButton(
                    buttonText: 'Add Book',
                    onPressed: () => homeCubit.validateBookThenUpload(),
                  ),
                ),
              ),
              BlocListener<HomeCubit, HomeState>(
                listenWhen: (previous, current) =>
                    current is Loading ||
                    current is Success ||
                    current is Error,
                listener: (context, state) {
                  state.whenOrNull(
                    loading: () {},
                    success: (response) async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(response.toString()),
                          backgroundColor: AppColors.green,
                        ),
                      );
                    },
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

class UpdateWidget extends StatefulWidget {
  final BookResponse book;
  const UpdateWidget({super.key, required this.book});

  @override
  State<UpdateWidget> createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  late TextEditingController bookNameController;
  late TextEditingController authorNameController;
  late String category;

  @override
  void initState() {
    bookNameController = TextEditingController(text: widget.book.bookName);
    authorNameController = TextEditingController(text: widget.book.authorName);
    category = widget.book.category;
    super.initState();
  }
  @override
  void dispose() {
    bookNameController.dispose();
    authorNameController.dispose();
    category = '';
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return SingleChildScrollView(
      child: Form(
        key: homeCubit.bookFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 200,
                    width: 150,
                    child: homeCubit.webImage == null
                        ? Image.network(
                            widget.book.imageLink,
                            fit: BoxFit.fill,
                            cacheWidth: 150,
                            cacheHeight: 200,
                          )
                        : Image.memory(
                            homeCubit.webImage ?? Uint8List(8),
                            fit: BoxFit.fill,
                            cacheWidth: 150,
                            cacheHeight: 200,
                          ),
                  );
                },
              ),
            ),
            const VerticalSpace(10),
            ElevatedButton(
              onPressed: () => homeCubit.pickImage(),
              child: const Text('Update cover'),
            ),
            const VerticalSpace(20),
            ElevatedButton(
              onPressed: () => homeCubit.pickPDF(),
              child: const Text('Update pdf'),
            ),
            const VerticalSpace(5),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Text(homeCubit.pdfFile?.files.first.name ?? '${widget.book.bookName}.pdf');
              },
            ),
            const VerticalSpace(20),
            SizedBox(
              width: 300,
              child: AppTitledTextField(
                controller: bookNameController,
                title: 'Book name',
                textFormHintText: 'Enter book name',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),
            const VerticalSpace(20),
            SizedBox(
              width: 300,
              child: AppTitledTextField(
                controller: authorNameController,
                title: 'Author name',
                textFormHintText: 'Enter author name',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),
            const VerticalSpace(20),
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: TextStyles.font16Black400Weight,
                  ),
                  const VerticalSpace(10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14.5),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.mainYellow, width: 1.3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.kRadius8)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.lightGray, width: 1.3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.kRadius8)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.red, width: 1.3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.kRadius8)),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.red, width: 1.3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.kRadius8)),
                        ),
                        hintStyle: TextStyles.font14Gray400Weight,
                        fillColor: AppColors.white,
                        filled: true,
                        hoverColor: AppColors.transparentWhite),
                    borderRadius: BorderRadius.circular(8),
                    value: category,
                    items: const [
                      DropdownMenuItem(value: 'Horror', child: Text('Horror')),
                      DropdownMenuItem(
                          value: 'Fiction', child: Text('Fiction')),
                      DropdownMenuItem(
                          value: 'Historical Fiction',
                          child: Text('Historical Fiction')),
                      DropdownMenuItem(
                          value: 'Mystery', child: Text('Mystery')),
                      DropdownMenuItem(
                          value: 'Science Fiction',
                          child: Text('Science Fiction')),
                      DropdownMenuItem(
                          value: 'Fantasy', child: Text('Fantasy')),
                      DropdownMenuItem(
                          value: 'Romance', child: Text('Romance')),
                      DropdownMenuItem(
                          value: 'Adventure', child: Text('Adventure')),
                    ],
                    onChanged: (value) =>{
                      category = value ?? ''
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
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
                  success: (response) async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response.toString()),
                        backgroundColor: AppColors.green,
                      ),
                    );
                  },
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

class AddBookMobileWidget extends StatelessWidget {
  const AddBookMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Form(
      key: homeCubit.bookFormKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: () => homeCubit.clearFields(),
                child: Text(
                  'Clear fields',
                  style: TextStyles.font14Red500Weight,
                ),
              ),
            ),
            const VerticalSpace(30),
            InkWell(
              onTap: () => homeCubit.pickImage(),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return DottedBorder(
                    borderPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    color: AppColors.black,
                    strokeWidth: 3,
                    borderType: BorderType.RRect,
                    dashPattern: const [8, 4],
                    radius: const Radius.circular(8),
                    child: Card(
                      elevation: 0,
                      color: AppColors.transparent,
                      child: SizedBox(
                        height: 200,
                        width: 150,
                        child: homeCubit.webImage == null
                            ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.image,
                                size: 40,
                              ),
                              Text('Upload book cover',
                                  style: TextStyles
                                      .font14Yellow400WeightElevated)
                            ],
                          ),
                        )
                            : Image.memory(
                          homeCubit.webImage ?? Uint8List(8),
                          fit: BoxFit.fill,
                          cacheWidth: 150,
                          cacheHeight: 200,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const VerticalSpace(20),
            ElevatedButton(
              onPressed: () => homeCubit.pickPDF(),
              child: const Text('Upload pdf'),
            ),
            const VerticalSpace(5),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Text(homeCubit.pdfFile?.files.first.name ?? '');
              },
            ),
            const VerticalSpace(20),
            SizedBox(
              width: 300,
              child: AppTitledTextField(
                controller: homeCubit.bookNameController,
                title: 'Book name',
                textFormHintText: 'Enter book name',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),
            const VerticalSpace(20),
            SizedBox(
              width: 300,
              child: AppTitledTextField(
                controller: homeCubit.authorController,
                title: 'Author name',
                textFormHintText: 'Enter author name',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),
            const VerticalSpace(20),
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: TextStyles.font16Black400Weight,
                  ),
                  const VerticalSpace(10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14.5),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.mainYellow, width: 1.3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.kRadius8)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.lightGray, width: 1.3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.kRadius8)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.red, width: 1.3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.kRadius8)),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.red, width: 1.3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.kRadius8)),
                        ),
                        hintStyle: TextStyles.font14Gray400Weight,
                        fillColor: AppColors.white,
                        filled: true,
                        hoverColor: AppColors.transparentWhite),
                    borderRadius: BorderRadius.circular(8),
                    value: homeCubit.categoryValue,
                    items: const [
                      DropdownMenuItem(
                          value: 'Horror', child: Text('Horror')),
                      DropdownMenuItem(
                          value: 'Fiction', child: Text('Fiction')),
                      DropdownMenuItem(
                          value: 'Historical Fiction',
                          child: Text('Historical Fiction')),
                      DropdownMenuItem(
                          value: 'Mystery', child: Text('Mystery')),
                      DropdownMenuItem(
                          value: 'Science Fiction',
                          child: Text('Science Fiction')),
                      DropdownMenuItem(
                          value: 'Fantasy', child: Text('Fantasy')),
                      DropdownMenuItem(
                          value: 'Romance', child: Text('Romance')),
                      DropdownMenuItem(
                          value: 'Adventure', child: Text('Adventure')),
                    ],
                    onChanged: (value) =>
                    homeCubit.categoryValue = value ?? '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const VerticalSpace(40),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: 200,
                child: AppTextButton(
                  buttonText: 'Add Book',
                  onPressed: () => homeCubit.validateBookThenUpload(),
                ),
              ),
            ),
            BlocListener<HomeCubit, HomeState>(
              listenWhen: (previous, current) =>
              current is Loading ||
                  current is Success ||
                  current is Error,
              listener: (context, state) {
                state.whenOrNull(
                  loading: () {},
                  success: (response) async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response.toString()),
                        backgroundColor: AppColors.green,
                      ),
                    );
                  },
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
