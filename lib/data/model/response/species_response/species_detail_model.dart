import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';

part 'species_detail_model.g.dart';

@JsonSerializable(explicitToJson: false, createToJson: false)
class SpeciesDetailModel extends SpeciesDetailEntity {
  const SpeciesDetailModel(
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
  factory SpeciesDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesDetailModelFromJson(json);
}
