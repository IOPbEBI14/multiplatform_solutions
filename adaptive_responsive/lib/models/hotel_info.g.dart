// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelInfoPreview _$HotelInfoPreviewFromJson(Map<String, dynamic> json) =>
    HotelInfoPreview(
      uuid: json['uuid'] as String? ?? ' ',
      name: json['name'] as String,
      poster: json['poster'] as String,
      address: HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      services:
          HotelServices.fromJson(json['services'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelInfoPreviewToJson(HotelInfoPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address.toJson(),
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services.toJson(),
      'photos': instance.photos,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) => HotelAddress(
      json['country'] as String,
      json['street'] as String,
      json['city'] as String,
    );

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
    };

HotelServices _$HotelServicesFromJson(Map<String, dynamic> json) =>
    HotelServices(
      (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelServicesToJson(HotelServices instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
