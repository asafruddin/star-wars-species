import 'package:flutter/foundation.dart';
import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';
import 'package:movie_app/domain/usecase/species/get_species_detail_usecase.dart';
import 'package:rxdart/subjects.dart';

class GetSpeciesDetailBloc {
  GetSpeciesDetailBloc(this.useCase);

  final GetSpeciesDetailUseCase useCase;

  final _speciesDetail = BehaviorSubject<SpeciesDetailEntity>();

  Function(SpeciesDetailEntity) get updateSpecies => _speciesDetail.sink.add;
  Stream<SpeciesDetailEntity> get data => _speciesDetail.stream;

  void getSpeciesDetail(String url) {
    useCase.execute(url).listen((event) {
      event.fold((l) {
        if (kDebugMode) {
          print('Something went wrong when get the species : ${l.message}');
          _speciesDetail.addError(l);
        }
      }, (r) => updateSpecies(r));
    });
  }

  void dispose() {
    _speciesDetail.close();
  }
}
