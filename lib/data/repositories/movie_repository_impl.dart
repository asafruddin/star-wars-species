import 'package:dartz/dartz.dart';
import 'package:movie_app/core/di/injector_container.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/data/datasource/common/base_datasource_factory.dart';
import 'package:movie_app/data/datasource/common/datasource_factory.dart';
import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/storage/local_storage.dart';

class SpeciesRepositoryImpl implements SpeciesRepository {
  SpeciesRepositoryImpl(this._bindingDataSources);

  late final BindingDataSourceFactory? _bindingDataSources;
  final SharedPrefs? prefs = sl<SharedPrefs>();

  @override
  Stream<Either<Failure, SpeciesEntity>> getSpeciesList(int page) {
    return _bindingDataSources!
        .createData(DataSourceState.network)
        .getSpeciesList(page)
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, SpeciesDetailEntity>> getSpeciesDetail(String url) {
    return _bindingDataSources!
        .createData(DataSourceState.network)
        .getSpeciesDetail(url)
        .map((event) => Right(event));
  }
}
