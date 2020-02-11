// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return SignInResponse(
    username: json['username'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    shop: BaseShopResponse.fromJson(json['shop'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'shop': instance.shop,
    };
