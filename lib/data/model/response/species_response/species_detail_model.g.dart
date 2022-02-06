// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesDetailModel _$SpeciesDetailModelFromJson(Map<String, dynamic> json) =>
    SpeciesDetailModel(
      json['name'] as String?,
      json['classification'] as String?,
      json['designation'] as String?,
      json['average_height'] as String?,
      json['skin_colors'] as String?,
      json['hair_colors'] as String?,
      json['eye_colors'] as String?,
      json['average_lifespan'] as String?,
      json['homeworld'] as String?,
      json['language'] as String?,
      (json['people'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['films'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['created'] as String?,
      json['edited'] as String?,
      json['url'] as String?,
    );
