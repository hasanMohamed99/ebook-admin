// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
      id: json['id'] as int,
      bookName: json['bookName'] as String,
      authorName: json['authorName'] as String,
      pdfLink: json['pdfLink'] as String,
      imageLink: json['imageLink'] as String,
      category: json['category'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$BookResponseToJson(BookResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookName': instance.bookName,
      'authorName': instance.authorName,
      'pdfLink': instance.pdfLink,
      'imageLink': instance.imageLink,
      'category': instance.category,
      'createdAt': instance.createdAt,
    };
