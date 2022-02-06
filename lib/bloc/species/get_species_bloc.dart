import 'package:flutter/foundation.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';
import 'package:movie_app/domain/usecase/species/get_species_usecase.dart';
import 'package:rxdart/subjects.dart';

class GetSpeciesBloc {
  GetSpeciesBloc(this.useCase);

  final GetSpeciesUseCase useCase;

  final _speciesData = BehaviorSubject<SpeciesEntity>();

  Function(SpeciesEntity) get updateSpecies => _speciesData.sink.add;

  Stream<SpeciesEntity> get data => _speciesData.stream;

  void getSpecies(int page) {
    useCase.execute(page).listen((event) {
      event.fold((l) {
        if (kDebugMode) {
          print('Something went wrong went get the species : ${l.message}');
        }
        _speciesData.addError(l);
      }, (r) => updateSpecies(r));
    });
  }

  void dispose() {
    _speciesData.close();
  }
}
