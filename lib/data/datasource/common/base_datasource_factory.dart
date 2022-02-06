// ignore_for_file: one_member_abstracts

abstract class BaseDataSourceFactory<T> {
  T createData(DataSourceState dataSourceState);
}

enum DataSourceState { network, local }
