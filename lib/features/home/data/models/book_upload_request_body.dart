import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';

class BookUploadRequestBody {
  final Uint8List image;
  final FilePickerResult pdfFile;
  final String authorName;
  final String bookName;
  final String category;

  BookUploadRequestBody({required this.image, required this.pdfFile, required this.authorName, required this.bookName, required this.category});


}