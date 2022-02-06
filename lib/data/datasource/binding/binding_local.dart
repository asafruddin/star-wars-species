import 'package:movie_app/data/datasource/binding_data_sources.dart';
import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';
import 'package:movie_app/storage/local_storage.dart';

class BindingLocal implements BindingDataSources {
  BindingLocal(this.prefs);

  final SharedPrefs? prefs;

  @override
  Stream<SpeciesEntity> getSpeciesList(int page) {
    throw UnimplementedError();
  }

  @override
  Stream<SpeciesDetailEntity> getSpeciesDetail(String id) {
    throw UnimplementedError();
  }
}
