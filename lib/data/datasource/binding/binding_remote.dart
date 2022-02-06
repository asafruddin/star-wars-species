import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_path_constant.dart';
import 'package:movie_app/core/di/injector_container.dart';
import 'package:movie_app/data/datasource/binding_data_sources.dart';
import 'package:movie_app/data/model/response/species_response/species_detail_model.dart';
import 'package:movie_app/data/model/response/species_response/species_list_model.dart';
import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';
import 'package:movie_app/storage/local_storage.dart';

class BindingRemote implements BindingDataSources {
  BindingRemote(this._client);

  late final Dio _client;
  SharedPrefs? prefs = sl<SharedPrefs>();

  @override
  Stream<SpeciesEntity> getSpeciesList(int page) async* {
    final response =
        await _client.get('${ApiPath.species}/?page=$page&format=json');

    yield SpeciesModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Stream<SpeciesDetailEntity> getSpeciesDetail(String url) async* {
    final response = await _client.get(url);
    yield SpeciesDetailModel.fromJson(response.data as Map<String, dynamic>);
  }
}
