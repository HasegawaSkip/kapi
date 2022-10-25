import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:kapi/data/kavita/models/series_detail/chapter.dart';
import 'package:kapi/data/kavita/models/series_detail/volume.dart';
import 'package:kapi/logic/bloc/image_bloc.dart';
import 'package:kapi/logic/cubit/reader_cubit.dart';

class MyReaderScreen extends StatelessWidget {
  final dynamic chapter;

  const MyReaderScreen({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isVolume = chapter.runtimeType == Volume;

    return BlocProvider(
      create: (context) => ReaderCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              isVolume ? chapter.name : chapter.title,
            ), // Text(chapter.name!),
            actions: const [_buildReaderSettings()],
          ),
          body: _buildReader(chapter: chapter)),
    );
  }
}

// develop
class _buildReaderBody extends StatelessWidget {
  const _buildReaderBody({
    Key? key,
    required this.isVolume,
    required this.chapter,
  }) : super(key: key);

  final bool isVolume;
  final chapter;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      _buildSliverAppBar(
        title: isVolume ? chapter.name : chapter.title,
        actions: [_buildReaderSettings()],
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        childCount: 3,
        (context, index) {
          return BlocBuilder(
            bloc: context.read<ReaderCubit>()
              ..getPageUrl(chapterId: chapter.id, page: index),
            builder: (context, state) {
              if (state is ReaderLoaded) {
                return InteractiveViewer(child: Image.memory(state.image));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ))

      // BlocProvider(
      //   create: (context) => ReaderCubit(),
      //   // ..getSeriesCoverImage(chapterId: volume.id!, page: 0),
      //   child: _buildReader(chapter: chapter),
      // ),
    ]);
  }
}

// develop
class _buildReaderSliverList extends StatelessWidget {
  const _buildReaderSliverList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (_, int index) {
        return ListTile(
          leading: Container(
              padding: EdgeInsets.all(8), width: 100, child: Placeholder()),
          title: Text('Place ${index + 1}', textScaleFactor: 2),
        );
      },
      childCount: 20,
    ));
  }
}

// develop
class _buildSliverAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const _buildSliverAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),
      ),
      actions: actions,
    );
  }
}

class _buildReaderSettings extends StatelessWidget {
  const _buildReaderSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: ((context) {
              return Text('asd');
            })),
        icon: const FaIcon(
          FontAwesomeIcons.sliders,
          size: 20,
        ));
  }
}

class _buildReader extends StatelessWidget {
  final dynamic chapter;
  const _buildReader({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderCubit, ReaderState>(
      bloc: ReaderCubit()..getPageUrl(chapterId: chapter.id!, page: 0),
      builder: (context, state) {
        if (state is ReaderLoaded) {
          return ListView(scrollDirection: Axis.vertical, children: [
            // Center(child: Image.memory(state.image))
            // child: Text(state.image.runtimeType.toString()),
            // Image.memory(state.image),
            // Image.memory(state.image),
            // Image.memory(state.image),
            // for (var i = 0; i <= chapter.pages!; i++)

            for (var i = 0; i <= 10; i++)
              // Text('Item $i ${volume.pages}')
              BlocBuilder<ReaderCubit, ReaderState>(
                  bloc: ReaderCubit()
                    ..getPageUrl(chapterId: chapter.id!, page: i),
                  builder: (context, state) {
                    if (state is ReaderLoaded) {
                      return SizedBox(
                        child: InteractiveViewer(
                            // panEnabled: false,
                            child: Image.memory(state.image)),
                      );
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  })
          ]);

          // return ListView.builder(
          //     itemCount: volume.pages,
          //     itemBuilder: ((context, index) {
          //       return Text(index.toString());
          //     }));
        } else {
          return
              // Text(state.toString()),
              Center(
                  child:
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   scrollDirection:
                      //       Axis.vertical, // Axis.horizontal for horizontal list view.
                      //   itemCount: 2,
                      //   itemBuilder: (ctx, index) {
                      //     return Align(child: Text('Text'));
                      //   },
                      // ),
                      ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Align(child: Text('${chapter.pages.toString()} pages')),
              const SizedBox(height: 15),
              const LinearProgressIndicator(),
            ],
          ));
        }
      },
    );
  }
}
