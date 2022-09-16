// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../core/data/model/province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      id: json['id'] as String?,
      name: json['name'] as String?,
      altName: json['alt_name'] as String?,
      lat: (json['latitude'] as num?)?.toDouble(),
      lng: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alt_name': instance.altName,
      'latitude': instance.lat,
      'longitude': instance.lng,
    };
