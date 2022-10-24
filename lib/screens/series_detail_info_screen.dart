import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:kapi/logic/cubit/series_metadata_cubit.dart';
import 'package:kapi/screens/components/section_title.dart';

import '../data/kavita/models/series/series.dart';
import '../data/kavita/models/series_metadata/tag.dart';
import '../logic/cubit/image_cubit.dart';

class SeriesInfo extends StatelessWidget {
  final Series series;
  const SeriesInfo(this.series, {super.key});

  @override
  Widget build(BuildContext context) {
    final kItems = [
      SeriesCoverImage(series),
      SeriesGenres(series),
      SeriesTags(series),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageCubit()..getSeriesCoverImage(series.id!),
        ),
        BlocProvider(
          create: (context) => SeriesMetadataCubit()..getMetadata(series.id!),
        ),
      ],
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(series.name!),
          actions: [
            IconButton(
                onPressed: (() => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Saved to Gallery. Will implement later')))),
                icon: const Icon(Icons.save_alt))
          ],
        ),
        body: DefaultTabController(
          length: kItems.length,
          child:
              // Builder(
              //   builder: (context) =>
              Column(
            children: [
              Expanded(
                  child: TabBarView(
                children: kItems,
              )),
              const TabPageSelector(),
            ],
          ),
          // ),
        ),
      ),
    );
  }
}

class SeriesCoverImage extends StatelessWidget {
  final Series series;
  const SeriesCoverImage(this.series, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          if (state is ImageLoaded) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(state.imageUrl))),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: InteractiveViewer(
                  // boundaryMargin: const EdgeInsets.all(20),
                  child: Image.network(
                    state.imageUrl.toString(),
                    // fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    // alignment: Alignment.center,
                  ),
                ),
              ),
            );
          }
          return InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20),
            child: Image.network(
              series.created.toString(),
              // fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          );
        },
      ),
    );
  }
}

class SeriesGenres extends StatelessWidget {
  final Series series;
  const SeriesGenres(this.series, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesMetadataCubit, SeriesMetadataState>(
      builder: (context, state) {
        if (state is SeriesMetadataLoaded) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const buildSectionTitle('Genres'),
            const SizedBox(height: 12),
            _buildChips(context, state.seriesMetadata.genres!)
          ]);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class SeriesTags extends StatelessWidget {
  final Series series;
  const SeriesTags(this.series, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesMetadataCubit, SeriesMetadataState>(
      builder: (context, state) {
        if (state is SeriesMetadataLoaded) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const buildSectionTitle('Tags'),
            const SizedBox(height: 12),
            _buildChips(context, state.seriesMetadata.tags!)
          ]);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

_buildChips(BuildContext context, List list) {
  return Center(
    child: list.isEmpty
        ? const Text('<empty>')
        : Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
                list.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(3),
                      child: Chip(
                        label: Chip(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            label: Text(list[index].title)),
                      ),
                    )),
          ),
  );
}
