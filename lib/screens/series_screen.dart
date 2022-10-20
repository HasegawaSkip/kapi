import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:kapi/data/kavita/models/series/series.dart';
import 'package:kapi/data/kavita/models/series_detail/volume.dart';
import 'package:kapi/logic/cubit/series_metadata_cubit.dart';
import 'package:kapi/screens/reader_screen.dart';

import '../logic/cubit/series_detail_cubit.dart';
import 'components/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class MySeriesScreen extends StatelessWidget {
  final Series series;
  const MySeriesScreen({
    Key? key,
    required this.series,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(series.name!),
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.more_horiz),
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          child: Text('Mark as Read'), value: 0),
                      PopupMenuItem(child: Text('Rate'), value: 1),
                      PopupMenuItem(child: Text('Refresh'), value: 2),
                      PopupMenuItem(
                          onTap: () => launchUrl(
                              Uri.parse('https://www.goodreads.com/')),
                          child: Text('Share'),
                          value: 3),
                      PopupMenuItem(child: Text('Download'), value: 4),
                    ])
          ],
        ),
        body: MultiBlocProvider(providers: [
          BlocProvider(
              create: (context) =>
                  SeriesMetadataCubit()..getMetadata(series.id!.toInt())),
          BlocProvider(
              create: (context) =>
                  SeriesDetailCubit()..getDetail(series.id!.toInt())),
        ], child: SeriesScreen(series: series)));
  }
}

//  showMenu(
//                 context: context,
//                 position: RelativeRect.fromLTRB(0, 0, 0, 0),
//                 items: [
//                   PopupMenuItem<String>(
//                       child: const Text('Open Series'), value: '1'),
//                   PopupMenuItem<String>(
//                       child: const Text('Mark as Read'), value: '2'),
//                   PopupMenuItem<String>(
//                       child: const Text('Add to Want to Read'), value: '3'),
//                 ],
//               ),

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({
    Key? key,
    required this.series,
  }) : super(key: key);

  final Series series;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        ScrollController(initialScrollOffset: 50.0, keepScrollOffset: true);
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle(
            series.name!,
            // style: Theme.of(context).textTheme.titleMedium,
          ),
          // Text(series.summary.toString() == null ? series.summary : ''),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width / 1.4, 0)),
                    onPressed: () => print('object'),
                    label: const Text('Read'),
                    icon: const FaIcon(FontAwesomeIcons.bookOpen)),
                ElevatedButton(
                    onPressed: () => print('object'),
                    child: const Icon(Icons.remove_red_eye_outlined)),
              ],
            ),
          ),
          const SizedBox(height: 15),
          buildSectionTitle('Description'),
          const SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  child: BlocBuilder<SeriesMetadataCubit, SeriesMetadataState>(
                    builder: (context, state) {
                      if (state is SeriesMetadataLoaded) {
                        return ListView(
                            controller: _scrollController,
                            children: [
                              Text(state.seriesMetadata.summary.toString())
                            ]);
                      } else {
                        return Text(state.toString());
                      }
                    },
                  )),
            ),
          ),
          const SizedBox(height: 15),

          BlocBuilder<SeriesDetailCubit, SeriesDetailState>(
              builder: ((context, state) {
            if (state is SeriesDetailLoaded) {
              final List<Volume> volumes = state.seriesDetail.volumes!;
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemCount: volumes.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: ListTile(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MyReaderScreen(
                                          volume: volumes[index]))),
                              title: Text(volumes[index].name!)),
                        );
                      })),
                ),
              );
            } else {
              return Text(state.toString());
            }
          })),
        ],
      ),
    );
  }
}
