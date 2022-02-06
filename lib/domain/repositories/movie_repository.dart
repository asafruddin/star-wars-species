import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';

abstract class SpeciesRepository {
  Stream<Either<Failure, SpeciesEntity>> getSpeciesList(int page);
  Stream<Either<Failure, SpeciesDetailEntity>> getSpeciesDetail(String url);
}
