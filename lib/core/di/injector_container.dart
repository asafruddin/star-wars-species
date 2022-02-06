// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';
import 'package:movie_app/bloc/species/get_species_bloc.dart';
import 'package:movie_app/bloc/species/get_species_detail_bloc.dart';
import 'package:movie_app/core/network/client.dart';
import 'package:movie_app/data/datasource/binding/binding_local.dart';
import 'package:movie_app/data/datasource/binding/binding_remote.dart';
import 'package:movie_app/data/datasource/common/datasource_factory.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecase/species/get_species_detail_usecase.dart';
import 'package:movie_app/domain/usecase/species/get_species_usecase.dart';
import 'package:movie_app/env/config.dart';
import 'package:movie_app/storage/local_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// [initial]
  /// important and primary
  final config = await Config.getInstance();
  final prefs = await SharedPrefs.getInstance();

  ///[environment]
  sl.registerLazySingleton(() => config);

  ///[localStorage]
  sl.registerLazySingleton(() => prefs);

  ///[network]
  sl.registerLazySingleton(() => sl<Client>().dio);
  sl.registerLazySingleton(() => Client(config: sl(), prefs: sl()));

  ///[data]
  sl.registerFactory(() => BindingLocal(sl()));
  sl.registerFactory(() => BindingRemote(sl()));

  ///[datasourcefactory]
  sl.registerFactory(
      () => BindingDataSourceFactory(bindingRemote: sl(), bindingLocal: sl()));

  ///[repository]
  sl.registerFactory<SpeciesRepository>(() => SpeciesRepositoryImpl(sl()));

  ///[usecase]
  sl.registerFactory(() => GetSpeciesUseCase(sl()));
  sl.registerFactory(() => GetSpeciesDetailUseCase(sl()));

  ///[bloc]
  sl.registerFactory(() => GetSpeciesBloc(sl()));
  sl.registerFactory(() => GetSpeciesDetailBloc(sl()));
}
