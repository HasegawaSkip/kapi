import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kapi/data/kavita/models/recently_added_item_dto/recently_added_item_dto.dart';
import 'package:kapi/logic/cubit/image_cubit.dart';
import 'package:kapi/screens/components/section_title.dart';
import 'package:kapi/screens/series_detail_screen.dart';

import '../data/kavita/models/series.dart';
import '../logic/bloc/series_bloc.dart';
// import 'components/series_card.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesBloc()..add(HomeScreenSeriesEvent()),
      child: BlocBuilder<SeriesBloc, SeriesState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(children: <Widget>[
              SizedBox(height: 15.0),
              buildSectionTitle('On Deck'),
              _buildOnDeckSeriesCarousel(state),
              SizedBox(height: 15.0),
              buildSectionTitle('Recently Updated Series'),
              SizedBox(height: 15.0),
              _buildRecentlyUpdatedSeriesCarousel(),
              buildSectionTitle('Newly Added Series'),
              SizedBox(height: 15.0),
              _buildNewlyAddedSeriesCarousel(state),
            ]),
          );
        },
      ),
    );
  }
}

class _buildRecentlyUpdatedSeriesCarousel extends StatelessWidget {
  const _buildRecentlyUpdatedSeriesCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        if (state is HomeScreenSeriesLoaded &&
            state.recentlyUpdated.isNotEmpty) {
          return Container(
            height: 200.0,
            child: ListView.builder(
              primary: false,
              // padding: const EdgeInsets.symmetric(horizontal: 15.0),
              scrollDirection: Axis.horizontal,
              itemCount: state.recentlyUpdated
                  .length, // homeProvider.top.feed?.entry?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                // Entry entry = homeProvider.top.feed!.entry![index];
                RecentlyAddedItemDto series = state.recentlyUpdated[index];
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: BlocBuilder<ImageCubit, ImageState>(
                      bloc: ImageCubit()..getSeriesCoverImage(series.seriesId!),
                      builder: (context, state) {
                        if (state is ImageLoaded) {
                          return SeriesCard(
                            title: series.seriesName!,
                            coverImage: NetworkImage(state.imageUrl),
                          );
                        } else {
                          return SeriesCard(
                            title: series.seriesName!,
                            coverImage: const NetworkImage(
                                'https://s4.anilist.co/file/anilistcdn/media/manga/cover/large/bx105778-82gwrvQV6OBc.png'),
                          );
                        }
                      },
                    ));
              },
            ),
          );
        }
        if (state is HomeScreenSeriesLoaded) {
          return const SizedBox.shrink();
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}

class _buildOnDeckSeriesCarousel extends StatelessWidget {
  final SeriesState state;

  const _buildOnDeckSeriesCarousel(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        if (state is HomeScreenSeriesLoaded && state.onDeck.isNotEmpty) {
          return SeriesCarousel(state.onDeck);
        }
        if (state is HomeScreenSeriesLoaded) {
          return const SizedBox.shrink();
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}

class _buildNewlyAddedSeriesCarousel extends StatelessWidget {
  final SeriesState state;

  const _buildNewlyAddedSeriesCarousel(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        if (state is HomeScreenSeriesLoaded && state.newlyAdded.isNotEmpty) {
          return SeriesCarousel(state.newlyAdded);
        }
        if (state is HomeScreenSeriesLoaded) {
          return const SizedBox.shrink();
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}

class SeriesCarousel extends StatelessWidget {
  final List<Series> seriesList;
  const SeriesCarousel(this.seriesList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        primary: false,
        // padding: const EdgeInsets.symmetric(horizontal: 15.0),
        scrollDirection: Axis.horizontal,
        itemCount:
            seriesList.length, // homeProvider.top.feed?.entry?.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          // Entry entry = homeProvider.top.feed!.entry![index];
          Series series = seriesList[index];

          return InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => MySeriesScreen(series: series)))),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: BlocBuilder<ImageCubit, ImageState>(
                  bloc: ImageCubit()..getSeriesCoverImage(series.id!),
                  builder: (context, state) {
                    if (state is ImageLoaded) {
                      return SeriesCard(
                        title: series.name!,
                        coverImage: NetworkImage(state.imageUrl),
                      );
                    } else {
                      return SeriesCard(
                        title: series.name!,
                        // coverImage: const NetworkImage(
                        //     'https://s4.anilist.co/file/anilistcdn/media/manga/cover/large/bx105778-82gwrvQV6OBc.png'),
                        coverImage: const AssetImage(
                            'assets/images/image-placeholder.dark-min.png'),
                      );
                    }
                  },
                )),
          );
        },
      ),
    );
  }
}

// _buildFeaturedSection(HomeProvider homeProvider) {
//   return Container(
//     height: 200.0,
//     child: Center(
//       child: ListView.builder(
//         primary: false,
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         scrollDirection: Axis.horizontal,
//         itemCount: homeProvider.top.feed?.entry?.length ?? 0,
//         shrinkWrap: true,
//         itemBuilder: (BuildContext context, int index) {
//           Entry entry = homeProvider.top.feed!.entry![index];
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
//             child: BookCard(
//               img: entry.link![1].href!,
//               entry: entry,
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }

class SeriesCard extends StatelessWidget {
  final String title;
  final ImageProvider coverImage; //NetworkImage or AssetImage

  const SeriesCard({Key? key, required this.title, required this.coverImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 200 / 1.6,
        decoration: BoxDecoration(
          image: DecorationImage(image: coverImage, fit: BoxFit.cover),
        ),
        child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.20,
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              decoration: const BoxDecoration(color: Colors.black54),
              alignment: Alignment.center,
              child:
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [

                  //   Flexible(child:
                  Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      title,
                      style: const TextStyle(color: Colors.white)),
              // ),
//                     // GestureDetector(
//                     //   onTapDown: (details) =>
//                     //       _showMenu(context, details.globalPosition),
//                     //   child: const Icon(
//                     //     Icons.more_vert,
//                     //     color: Colors.white,
//                     //   ),
//                     // )
// //                       )
              // ],
            )),
      ),
    );
  }

  Future<String?> _showMenu(BuildContext context, Offset globalPosition) {
    double left = globalPosition.dx - 200;
    double top = globalPosition.dy + 20;
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem<String>(child: const Text('Open Series'), value: '1'),
        PopupMenuItem<String>(child: const Text('Mark as Read'), value: '2'),
        PopupMenuItem<String>(
            child: const Text('Add to Want to Read'), value: '3'),
      ],
    );
  }
}
