import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kapi/logic/cubit/image_cubit.dart';
import 'package:kapi/logic/cubit/series_cubit.dart';
import 'components/series_card.dart';
import 'package:kapi/screens/series_detail_screen.dart';
import 'package:kapi/data/kavita/models/libraryDto.dart';

import '../data/kavita/models/series.dart';

class MySeriesListScreen extends StatelessWidget {
  final LibraryDto library;
  const MySeriesListScreen({
    Key? key,
    required this.library,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesCubit()..getSeriesForLibrary(library.id!),
      child: Scaffold(
          appBar: AppBar(title: Text(library.name!)), body: SeriesListScreen()),
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
          return RefreshIndicator(
            onRefresh: () =>
                Future.delayed(Duration(seconds: 1), (() => print('asd'))),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.6,
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    itemCount: state.seriesList.length,
                    itemBuilder: ((context, index) {
                      final Series series = state.seriesList[index];
                      return InkWell(
                        onTap: (() => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    MySeriesScreen(series: series)))),
                        child: BlocProvider(
                          create: (context) => ImageCubit()
                            ..getSeriesCoverImage(series.id!.toInt()),
                          child: BlocBuilder<ImageCubit, ImageState>(
                            builder: (context, state) {
                              if (state is ImageLoaded) {
                                return GestureDetector(
                                  child: SeriesCard(
                                      title: series.name!,
                                      coverImage: NetworkImage(state.imageUrl)),
                                );
                              } else {
                                return SeriesCard(
                                    title: series.name!,
                                    coverImage: const AssetImage(
                                        'assets/images/image-placeholder.dark-min.png'));
                              }
                            },
                          ),
                        ),
                      );
                    })),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// Card(
//                     elevation: 4.0,
//                     child: ListTile(
//                       onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               MySeriesScreen(series: series))),
//                       title: Text(series.name!),
//                       trailing: GestureDetector(
//                         onTapDown: (details) =>
//                             _showMenu(context, details.globalPosition),
//                         child: Icon(Icons.more_vert),
//                       ),
//                     ),
//                   );
