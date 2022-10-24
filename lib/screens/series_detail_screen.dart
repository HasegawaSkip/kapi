import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapi/data/kavita/api/api_client.dart';

import 'package:kapi/data/kavita/models/series/series.dart';
import 'package:kapi/data/kavita/models/series_detail/chapter.dart';
import 'package:kapi/data/kavita/models/series_detail/series_detail.dart';
import 'package:kapi/data/kavita/models/series_detail/special.dart';
import 'package:kapi/data/kavita/models/series_detail/storyline_chapter.dart';
import 'package:kapi/data/kavita/models/series_detail/volume.dart';
import 'package:kapi/logic/bloc/image_bloc.dart';
import 'package:kapi/logic/cubit/image_cubit.dart';
import 'package:kapi/logic/cubit/series_metadata_cubit.dart';
import 'package:kapi/screens/cubit/chip_cubit.dart';
import 'package:kapi/screens/reader_screen.dart';
import 'package:kapi/screens/series_detail_info_screen.dart';

import '../logic/cubit/series_detail_cubit.dart';
import 'components/section_title.dart';
import 'package:flutter_html/flutter_html.dart';

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
          // title: Text(series.name!),
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.more_horiz),
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          child: Text('Mark as Read'), value: 0),
                      PopupMenuItem(child: Text('Rate'), value: 1),
                      PopupMenuItem(child: Text('Refresh'), value: 2),
                      PopupMenuItem(child: Text('Share'), value: 4),
                      // onTap: () => launchUrl(
                      //     Uri.parse('https://www.goodreads.com/')),
                      // child: Text('Share'),
                      // value: 3),
                      PopupMenuItem(child: Text('Download'), value: 4),
                    ])
          ],
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      SeriesMetadataCubit()..getMetadata(series.id!.toInt())),
              BlocProvider(
                  create: (context) =>
                      SeriesDetailCubit()..getDetail(series.id!.toInt())),
              BlocProvider(create: (context) => ImageBloc()),
            ],
            child: RefreshIndicator(
                onRefresh: () => Future.delayed(Duration(milliseconds: 3000),
                    () => print('onSeries_onRefresh to be implemented')),
                child: SeriesScreen(series))));
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
  const SeriesScreen(
    this.series, {
    Key? key,
  }) : super(key: key);

  final Series series;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
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
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => SeriesInfo(series)),
                        )),
                    child: const Icon(Icons.info)),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(children: [
            const buildSectionTitle('Description'),
            // const SizedBox(width: 8),
            BlocBuilder<SeriesMetadataCubit, SeriesMetadataState>(
              builder: (context, state) {
                if (state is SeriesMetadataLoaded) {
                  if (state.seriesMetadata.summary!.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return InkWell(
                      onTap: () => showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                                title: const Text('Description'),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: SelectableText(
                                        state.seriesMetadata.summary!),
                                  )
                                ]),
                          ),
                      child: const Icon(Icons.fullscreen));
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ]),
          // const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: BlocBuilder<SeriesMetadataCubit, SeriesMetadataState>(
              builder: (context, state) {
                if (state is SeriesMetadataLoaded) {
                  if (state.seriesMetadata.summary!.isEmpty) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                        child: const Center(
                          child: Text(
                            '<empty>',
                          ),
                        ));
                  }
                  return Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                      child: ListView(controller: _scrollController, children: [
                        Html(
                          data: state.seriesMetadata.summary!
                              .replaceAll('\n', '<br>'),
                        )
                        // Text(state.seriesMetadata.summary.toString()
                        //   ..replaceAll(RegExp('\n'), '<br>'))
                      ]),
                    ),
                  );
                } else {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                      child: const Center(child: Text('Loading...')));
                }
              },
            ),
          ),
          BlocBuilder<SeriesDetailCubit, SeriesDetailState>(
              builder: ((context, state) {
            if (state is SeriesDetailLoaded) {
              final List<Volume> volumes = state.seriesDetail.volumes!;
              final List<Special> specials = state.seriesDetail.specials!;
              final List<StorylineChapter> storylineChapters =
                  state.seriesDetail.storylineChapters!;
              final List<Chapter> chapters = state.seriesDetail.chapters!;

              return BlocProvider(
                create: (context) => ChipCubit(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildChips(state.seriesDetail),
                    BlocBuilder<ChipCubit, int>(
                      builder: (context, state) {
                        return IndexedStack(index: state, children: [
                          const SizedBox.shrink(),
                          _buildChipContent(specials),
                          _buildChipContent(storylineChapters),
                          _buildChipContent(volumes),
                          _buildChipContent(chapters),
                        ]);
                      },
                    )
                    // _buildChipContent(chapters),
                  ],
                ),
              );
            } else {
              return const LinearProgressIndicator();
            }
          })),
        ],
      ),
    );
  }
}

class _buildChipContent extends StatelessWidget {
  const _buildChipContent(this.content, {Key? key}) : super(key: key);

  final List<dynamic> content;

  @override
  Widget build(BuildContext context) {
    final bool isVolume = content.runtimeType == List<Volume>;

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.4,
        child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemCount: content.length,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                  onTap: () =>
                      // isChapter
                      //     ? print('Chapter')
                      //     :
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MyReaderScreen(chapter: content[index]))),
                  title: isVolume
                      ? Text(content[index].name!)
                      : Text(content[index].title!),
                  subtitle: Text('${content[index].pages.toString()} pages'),
                  leading: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: _buildVolumeCoverLeadingImage(
                      isVolume: isVolume,
                      id: content[index].id,
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}

class _buildVolumeCoverLeadingImage extends StatelessWidget {
  final bool isVolume;
  final int id;
  final ApiClient apiClient = ApiClient();

  _buildVolumeCoverLeadingImage({
    Key? key,
    required this.isVolume,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = isVolume
        ? "${apiClient.dio.options.baseUrl}/api/Image/volume-cover?volumeId=$id"
        : "${apiClient.dio.options.baseUrl}/api/Image/chapter-cover?chapterId=$id";
    Map<String, String> headers = {
      "Authorization": apiClient.dio.options.headers["Authorization"]
    };

    // return
    // BlocBuilder<ImageBloc, ImageState>(
    //     bloc: isVolume
    //         ? (context.read<ImageBloc>()..add(GetVolumeCoverImageEvent(id)))
    //         : (context.read<ImageBloc>()..add(GetChapterCoverImageEvent(id))),
    //     builder: (context, state) {
    //       if (state is ImageLoaded) {
    // return Image.network(state.imageUrl);
    return Image.network(
      imageUrl,
      headers: headers,
    );
  }
  // else {
  //   return Image.asset(
  //     'assets/images/image-placeholder.dark-min.png',
  //   );
}
//         });
//   }
// }

class _buildChips extends StatefulWidget {
  final SeriesDetail seriesDetail;
  const _buildChips(this.seriesDetail, {super.key});

  @override
  State<_buildChips> createState() => _buildChipsState();
}

class _buildChipsState extends State<_buildChips> {
  int? _value = 0;
  late List<StorylineChapter> storylineChapters =
      widget.seriesDetail.storylineChapters!;
  late List<Volume> volumes = widget.seriesDetail.volumes!;
  late List<Chapter> chapters = widget.seriesDetail.chapters!;
  late List<Special> specials = widget.seriesDetail.specials!;

  late List seriesDetail = [[], specials, storylineChapters, volumes, chapters];
  List chips = [];
  // print(widget.seriesDetail.storylineChapters!.length);
  // print(widget.seriesDetail.volumes!.length);
  // print(widget.seriesDetail.chapters!.length);
  // print(widget.seriesDetail.specials!.length);

  @override
  void initState() {
    super.initState();

    chips.addAll(seriesDetail.where((element) => element.isNotEmpty));
    context.read<ChipCubit>().onSelected(seriesDetail.indexOf(chips[0]));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(chips.length, ((index) {
          // if (index.isOdd) {
          //   return const SizedBox(width: 8);
          // }

          // final i = index ~/ 2;

          final int chipIndex = seriesDetail.indexOf(chips[index]);

          return ChoiceChip(
              shape: const RoundedRectangleBorder(),
              label: Text(TabID.values[chipIndex].name),
              selected: _value == index,
              onSelected: (bool selected) {
                context
                    .read<ChipCubit>()
                    .onSelected(TabID.values.indexOf(TabID.values[chipIndex]));
                setState(() {
                  // TabID.values.
                  _value = index;
                  // _value = index ? index : null
                });
              });
        })),
        // List<Widget>.generate(
        //   20,
        //   (int index) {
        //     if (index.isOdd) {
        //       return const SizedBox(width: 8);
        //     }
        //     final i = index ~/ 2;
        //     return ChoiceChip(
        //       label: Text('Item $i'),
        //       selected: _value == index,
        //       onSelected: (bool selected) {
        //         setState(() {
        //           _value = selected ? index : null;
        //         });
        //       },
        //     );
        //   },
        // ).toList(),
      ),
    );
  }
}

// Storyline
// Volumes
// Chapters/Issues
// Specials

enum TabID {
  Related,
  Specials,
  Storyline,
  Volumes,
  Chapters,
}
