// ignore_for_file: use_named_constants, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/bloc/species/get_species_bloc.dart';
import 'package:movie_app/core/di/injector_container.dart';
import 'package:movie_app/domain/entity/species_entity/species_entity.dart';
import 'package:movie_app/presentation/species_detail/species_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _getSpecies = sl<GetSpeciesBloc>();
  final _pagingController =
      PagingController<int, SpeciesResultEntity>(firstPageKey: 1);

  void getSpecies(int pageKey) {
    try {
      _getSpecies.getSpecies(pageKey);
      var i = 0;

      _getSpecies.data.listen((event) {
        if (i == 0 && event.results != null) {
          i++;

          final previouslyFetchedItems =
              _pagingController.itemList?.length ?? 0;
          final isLastPage = event.isLast(previouslyFetchedItems);
          final newItems = event.results;

          if (isLastPage) {
            _pagingController.appendLastPage(newItems!);
          } else {
            final nextPageKey = pageKey + 1;
            _pagingController.appendPage(newItems!, nextPageKey);
          }
        }
      });
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(getSpecies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(_pagingController.refresh),
          child: PagedListView(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<SpeciesResultEntity>(
                itemBuilder: (context, item, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.person,
                            color: Theme.of(context).colorScheme.onPrimary)),
                    title: Text(item.name!),
                    subtitle: Text(item.classification!),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () => Get.to(() => SpeciesDetail(url: item.url!)),
                  );
                },
              )),
        ));
  }
}
