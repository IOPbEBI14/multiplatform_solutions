import 'package:json_annotation/json_annotation.dart';

part 'hotel_info.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelInfoPreview {
  @JsonKey(defaultValue: ' ')
  final String uuid;
  final String name;
  final String poster;
  final HotelAddress address;
  final double price;
  final double rating;
  final HotelServices services;
  final List<String> photos;

  HotelInfoPreview(
      {required this.uuid,
      required this.name,
      required this.poster,
      required this.address,
      required this.price,
      required this.rating,
      required this.services,
      required this.photos});

  factory HotelInfoPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoPreviewToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelAddress {
  final String country;
  final String street;
  final String city;

  HotelAddress(this.country, this.street, this.city);

  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);

  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelServices {
  final List<String> free;
  final List<String> paid;

  HotelServices(this.free, this.paid);

  factory HotelServices.fromJson(Map<String, dynamic> json) =>
      _$HotelServicesFromJson(json);

  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);
}
