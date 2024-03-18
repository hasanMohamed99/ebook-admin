// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeUserResponse _$HomeUserResponseFromJson(Map<String, dynamic> json) =>
    HomeUserResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      authId: json['authId'] as String,
    );

Map<String, dynamic> _$HomeUserResponseToJson(HomeUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'authId': instance.authId,
    };
