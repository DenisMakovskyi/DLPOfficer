// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseShopResponse _$BaseShopResponseFromJson(Map<String, dynamic> json) {
  return BaseShopResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    thumbLogoUrl: json['thumb_logo'] as String,
    address: json['address'] as String,
    coordinates: json['coordinates_str'] as String,
  );
}

Map<String, dynamic> _$BaseShopResponseToJson(BaseShopResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb_logo': instance.thumbLogoUrl,
      'address': instance.address,
      'coordinates_str': instance.coordinates,
    };
