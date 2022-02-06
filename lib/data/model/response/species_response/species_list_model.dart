import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';

part 'species_list_model.g.dart';

@JsonSerializable(explicitToJson: false, createToJson: false)
class SpeciesModel extends SpeciesEntity {
  const SpeciesModel(int? count, String? next, String? previous,
      List<SpeciesResultModel>? results)
      : super(count, next, previous, results);

  factory SpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesModelFromJson(json);
}

@JsonSerializable(explicitToJson: false, createToJson: false)
class SpeciesResultModel extends SpeciesResultEntity {
  const SpeciesResultModel(
      String? name,
      String? classification,
      String? designation,
      String? averageHeight,
      String? skinColors,
      String? hairColors,
      String? eyeColors,
      String? averageLifespan,
      String? homeworld,
      String? language,
      List<String>? people,
      List<String>? films,
      String? created,
      String? edited,
      String? url)
      : super(
            name,
            classification,
            designation,
            averageHeight,
            skinColors,
            hairColors,
            eyeColors,
            averageLifespan,
            homeworld,
            language,
            people,
            films,
            created,
            edited,
            url);

  factory SpeciesResultModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesResultModelFromJson(json);
}
