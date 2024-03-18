import 'package:json_annotation/json_annotation.dart';
part 'home_user_response.g.dart';

@JsonSerializable()
class HomeUserResponse {
  final int id;
  final String name;
  final String email;
  final String authId;

  HomeUserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.authId,
  });

  factory HomeUserResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeUserResponseFromJson(json);
}
