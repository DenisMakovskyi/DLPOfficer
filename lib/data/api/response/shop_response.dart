import 'package:json_annotation/json_annotation.dart';

part 'shop_response.g.dart';

@JsonSerializable(nullable: false)
class BaseShopResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "thumb_logo")
  final String thumbLogoUrl;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "coordinates_str")
  final String coordinates;

  BaseShopResponse(
      {this.id, this.name, this.thumbLogoUrl, this.address, this.coordinates});

  factory BaseShopResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseShopResponseFromJson(json);
}
