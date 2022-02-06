import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';

abstract class BindingDataSources {
  /// species
  Stream<SpeciesEntity> getSpeciesList(int page);
  Stream<SpeciesDetailEntity> getSpeciesDetail(String url);
}
