import 'package:json_annotation/json_annotation.dart';

import 'package:dlp_officer/data/api/response/shop_response.dart';

part 'auth_response.g.dart';

@JsonSerializable(nullable: false)
class AuthenticationResponse {
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "shop")
  final BaseShopResponse shop;

  AuthenticationResponse({this.username, this.firstName, this.lastName, this.shop});

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
}
