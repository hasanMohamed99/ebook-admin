import 'package:json_annotation/json_annotation.dart';
part 'book_response.g.dart';

@JsonSerializable()
class BookResponse {
  final int id;
  final String bookName;
  final String authorName;
  final String pdfLink;
  final String imageLink;
  final String category;
  final String createdAt;

  BookResponse({
    required this.id,
    required this.bookName,
    required this.authorName,
    required this.pdfLink,
    required this.imageLink,
    required this.category,
    required this.createdAt,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);
}
