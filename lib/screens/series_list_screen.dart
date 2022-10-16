import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapi/logic/cubit/series_cubit.dart';
import 'package:kapi/screens/series_screen.dart';

import '../data/kavita/models/series.dart';

class MySeriesListScreen extends StatelessWidget {
  final int libraryId;
  const MySeriesListScreen({
    Key? key,
    required this.libraryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesCubit()..getSeriesForLibrary(libraryId),
      child: Scaffold(body: SeriesListScreen()),
    );
  }
}

class SeriesListScreen extends StatelessWidget {
  const SeriesListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesCubit, SeriesState>(
      builder: (context, state) {
        if (state is SeriesLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: state.seriesList.length,
                itemBuilder: ((context, index) {
                  final Series series = state.seriesList[index];
                  return Card(
                    child: ListTile(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    MySeriesScreen(series: series))),
                        title: Text(series.name!)),
                  );
                })),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
