import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part '../../../gen/core/data/model/province.g.dart';

@JsonSerializable()
class Province extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'alt_name')
  final String? altName;

  @JsonKey(name: 'latitude')
  final double? lat;

  @JsonKey(name: 'longitude')
  final double? lng;

  const Province({
    this.id,
    this.name,
    this.altName,
    this.lat,
    this.lng,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        altName,
        lat,
        lng,
      ];
  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
