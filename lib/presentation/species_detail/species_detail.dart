// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie_app/bloc/species/get_species_detail_bloc.dart';
import 'package:movie_app/core/di/injector_container.dart';
import 'package:movie_app/domain/entity/species_entity/species_detail_entity.dart';

class SpeciesDetail extends StatefulWidget {
  const SpeciesDetail({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  _SpeciesDetailState createState() => _SpeciesDetailState();
}

class _SpeciesDetailState extends State<SpeciesDetail> {
  final _speciesDetail = sl<GetSpeciesDetailBloc>();

  @override
  void initState() {
    super.initState();

    _speciesDetail.getSpeciesDetail(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Species Detail'),
      ),
      body: StreamBuilder<SpeciesDetailEntity>(
          stream: _speciesDetail.data,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.dangerous_outlined,
                    color: Theme.of(context).colorScheme.error,
                    size: size.width / 5,
                  ),
                  Center(
                    child: Text(
                      'The Data Still Empty',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Theme.of(context).colorScheme.error),
                    ),
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: size.width / 5,
                    child: Icon(Icons.person,
                        size: size.width / 5,
                        color: Theme.of(context).colorScheme.onPrimary)),
                const SizedBox(height: 10),
                Center(
                    child: Text(snapshot.data?.name ?? '-',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold))),
                Center(
                    child: Text(snapshot.data?.classification ?? '-',
                        style: Theme.of(context).textTheme.subtitle1)),
                SizedBox(height: size.width / 7),
                RowData(
                  size: size,
                  content: snapshot.data?.designation ?? '-',
                  label: 'Designation',
                ),
                RowData(
                  size: size,
                  content: snapshot.data?.averageHeight ?? '-',
                  label: 'Average Height',
                ),
                RowData(
                  size: size,
                  content: snapshot.data?.skinColors ?? '-',
                  label: 'Skin Colors',
                ),
                RowData(
                  size: size,
                  content: snapshot.data?.hairColors ?? '-',
                  label: 'Hair Colors',
                ),
                RowData(
                  size: size,
                  content: snapshot.data?.eyeColors ?? '-',
                  label: 'Eye Colors',
                ),
                RowData(
                  size: size,
                  content: snapshot.data?.averageLifespan ?? '-',
                  label: 'Average Lifespan',
                ),
                RowData(
                  size: size,
                  content: snapshot.data?.language ?? '-',
                  label: 'Language',
                ),
              ],
            );
          }),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData({Key? key, required this.size, this.content, this.label})
      : super(key: key);

  final Size size;
  final String? content;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: size.width / 3,
            child: Text(
              label ?? 'label',
              style: Theme.of(context).textTheme.caption,
            )),
        const Text(': '),
        Expanded(
            child: Text(
          content ?? '-',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontWeight: FontWeight.w600),
        ))
      ]),
    );
  }
}
