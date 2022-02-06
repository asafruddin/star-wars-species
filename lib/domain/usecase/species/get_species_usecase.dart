import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/core/use_case/use_case.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class GetSpeciesUseCase extends UseCase<SpeciesEntity, int> {
  GetSpeciesUseCase(this.repository);

  final SpeciesRepository repository;

  @override
  Stream<Either<Failure, SpeciesEntity>> build(int params) {
    return repository.getSpeciesList(params);
  }
}
