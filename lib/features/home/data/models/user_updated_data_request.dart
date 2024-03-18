import 'package:json_annotation/json_annotation.dart';
part 'user_updated_data_request.g.dart';

@JsonSerializable()
class UserUpdatedDataRequest {
  final int id;
  final String name;
  final String email;
  final String status;
  @JsonKey(name: 'auth_id')
  final String authId;

  UserUpdatedDataRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.status,
    required this.authId,
  });

  Map<String, dynamic> toJson() => _$UserUpdatedDataRequestToJson(this);
}
