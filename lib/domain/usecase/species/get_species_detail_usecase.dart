import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/core/use_case/use_case.dart';
import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class GetSpeciesDetailUseCase extends UseCase<SpeciesDetailEntity, String> {
  GetSpeciesDetailUseCase(this.repository);

  final SpeciesRepository repository;
  @override
  Stream<Either<Failure, SpeciesDetailEntity>> build(String params) {
    return repository.getSpeciesDetail(params);
  }
}
