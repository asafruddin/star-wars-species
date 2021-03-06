// ignore_for_file: no_default_cases

import 'package:movie_app/data/datasource/binding/binding_local.dart';
import 'package:movie_app/data/datasource/binding/binding_remote.dart';
import 'package:movie_app/data/datasource/binding_data_sources.dart';
import 'package:movie_app/data/datasource/common/base_datasource_factory.dart';

class BindingDataSourceFactory
    extends BaseDataSourceFactory<BindingDataSources> {
  BindingDataSourceFactory(
      {required BindingRemote bindingRemote,
      required BindingLocal bindingLocal})
      : _bindingLocal = bindingLocal,
        _bindingRemote = bindingRemote;

  final BindingRemote? _bindingRemote;
  final BindingLocal? _bindingLocal;
  @override
  BindingDataSources createData(DataSourceState dataSourceState) {
    switch (dataSourceState) {
      case DataSourceState.local:
        return _bindingLocal!;
      case DataSourceState.network:
        return _bindingRemote!;
      default:
        throw UnsupportedError('''
DataSourceState $dataSourceState is not applicable in BindingDataSourceFactory''');
    }
  }
}
