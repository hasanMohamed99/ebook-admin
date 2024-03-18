import 'dart:io';
import 'dart:typed_data';
import 'package:ebook_task_admin/features/home/data/models/book_response.dart';
import 'package:ebook_task_admin/features/home/data/models/user_updated_data_request.dart';
import 'package:ebook_task_admin/features/home/data/repo/home_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/models/book_upload_request_body.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  Stream<dynamic> getPendingUser() {
    try {
      _homeRepo.getPendingUsers().forEach((element) {
        emit(HomeState.success(element));
      });
    } on SocketException catch (error) {
      emit(HomeState.error(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.error(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.error(message: error.toString()));
    } catch (error) {
      emit(HomeState.error(message: error.toString()));
    }
    return _homeRepo.getPendingUsers();
  }

  Stream<dynamic> getAcceptedUser() {
    try {
      _homeRepo.getAcceptedUsers().forEach((element) {
        emit(HomeState.success(element));
      });
    } on SocketException catch (error) {
      emit(HomeState.error(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.error(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.error(message: error.toString()));
    } catch (error) {
      emit(HomeState.error(message: error.toString()));
    }
    return _homeRepo.getPendingUsers();
  }

  void updateUserData(
      {required UserUpdatedDataRequest userUpdatedDataRequest}) async {
    emit(const HomeState.loading());
    try {
      await _homeRepo.updateUserStatus(userUpdatedDataRequest);
      emit(const HomeState.success(''));
    } on SocketException catch (error) {
      emit(HomeState.error(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.error(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.error(message: error.toString()));
    } catch (error) {
      emit(HomeState.error(message: error.toString()));
    }
  }

  void deleteUser({required int id, required String authId}) async {
    emit(const HomeState.loading());
    try {
      await _homeRepo.deleteUser(authId: authId).then((value) async =>
          await _homeRepo.denyUser(id: id).then((value) =>
              emit(const HomeState.success('User Deleted'))));
    } on SocketException catch (error) {
      emit(HomeState.error(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.error(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.error(message: error.toString()));
    } catch (error) {
      emit(HomeState.error(message: error.toString()));
    }
  }

  void sendConfirmEmail({required String email}) async {
    emit(const HomeState.loading());
    try {
      final UserResponse response =
          await _homeRepo.sendConfirmEmail(email: email);
      if (response.user != null) {
        emit(const HomeState.success(''));
      } else {
        emit(const HomeState.error(
            message: 'Something went wrong please try again later'));
      }
    } on SocketException catch (error) {
      emit(HomeState.error(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.error(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.error(message: error.toString()));
    } catch (error) {
      emit(HomeState.error(message: error.toString()));
    }
  }

  ///Manage Books

  void deleteBook({required int id}) async {
    emit(const HomeState.loading());
    try {
      await _homeRepo.deleteBook(id: id).then((value) {
        emit(const HomeState.success('Book Deleted'));
      });
    } on SocketException catch (error) {
      emit(HomeState.error(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.error(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.error(message: error.toString()));
    } catch (error) {
      emit(HomeState.error(message: error.toString()));
    }
  }

  Stream<dynamic> getBooks() {
    try {
      _homeRepo.getBooks().forEach((element) {
        emit(HomeState.success(element));
      });
    } on SocketException catch (error) {
      emit(HomeState.error(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.error(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.error(message: error.toString()));
    } catch (error) {
      emit(HomeState.error(message: error.toString()));
    }
    return _homeRepo.getBooks();
  }

  Uint8List? webImage;
  FilePickerResult? pdfFile;
  final authorController = TextEditingController();
  TextEditingController bookNameController = TextEditingController();
  String categoryValue = 'Horror';

  final bookFormKey = GlobalKey<FormState>();

  void validateBookThenUpload() {
    if (bookFormKey.currentState!.validate() &&
        webImage != null &&
        pdfFile!.files.isNotEmpty) {
      _uploadBook(
        BookUploadRequestBody(
          image: webImage!,
          pdfFile: pdfFile!,
          authorName: authorController.text,
          bookName: bookNameController.text,
          category: categoryValue,
        ),
      );
    }
  }

  Future<void> _uploadBook(BookUploadRequestBody bookUploadRequestBody) async {
    emit(const HomeState.loading());
    try {
      _homeRepo
          .addBook(bookUploadRequestBody: bookUploadRequestBody)
          .then((value) {
        emit(const HomeState.success('Book uploaded successfully'));
        clearFields();
      });
    } on SocketException catch (error) {
      emit(HomeState.error(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.error(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.error(message: error.toString()));
    } catch (error) {
      emit(HomeState.error(message: error.toString()));
    }
  }

  void clearFields() {
    webImage = null;
    pdfFile = null;
    authorController.clear();
    bookNameController.clear();
    categoryValue = 'Horror';
    emit(const HomeState.success('Fields cleared'));
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      webImage = await image.readAsBytes();
      emit(const HomeState.success('Image uploaded successfully'));
    } else {
      emit(const HomeState.error(message: 'Image not uploaded'));
    }
  }

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );
    if (result != null) {
      pdfFile = result;
      emit(const HomeState.success('PDF uploaded successfully'));
    } else {
      emit(const HomeState.error(message: 'PDF not uploaded'));
    }
  }
}
