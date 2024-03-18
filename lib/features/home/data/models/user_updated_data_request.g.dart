// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_updated_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdatedDataRequest _$UserUpdatedDataRequestFromJson(
        Map<String, dynamic> json) =>
    UserUpdatedDataRequest(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      status: json['status'] as String,
      authId: json['auth_id'] as String,
    );

Map<String, dynamic> _$UserUpdatedDataRequestToJson(
        UserUpdatedDataRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'status': instance.status,
      'auth_id': instance.authId,
    };
