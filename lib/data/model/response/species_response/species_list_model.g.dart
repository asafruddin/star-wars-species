// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesModel _$SpeciesModelFromJson(Map<String, dynamic> json) => SpeciesModel(
      json['count'] as int?,
      json['next'] as String?,
      json['previous'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => SpeciesResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SpeciesResultModel _$SpeciesResultModelFromJson(Map<String, dynamic> json) =>
    SpeciesResultModel(
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
