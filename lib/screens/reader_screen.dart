import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kapi/data/kavita/models/series_detail/volume.dart';
import 'package:kapi/data/kavita/models/series_detail/chapter.dart';

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

    return Scaffold(
        appBar: AppBar(
          title: Text(
              isVolume ? chapter.name : chapter.title), // Text(chapter.name!),
          actions: const [_buildReaderSettings()],
        ),
        body: BlocProvider(
          create: (context) => ReaderCubit(),
          // ..getSeriesCoverImage(chapterId: volume.id!, page: 0),
          child: _buildReader(chapter: chapter),
        ));
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
        icon: const Icon(Icons.settings_applications));
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
            // for (var i = 0; i <= volume.pages!; i++)

            for (var i = 0; i <= 10; i++)
              // Text('Item $i ${volume.pages}')
              BlocBuilder<ReaderCubit, ReaderState>(
                  bloc: ReaderCubit()
                    ..getPageUrl(chapterId: chapter.id!, page: i),
                  builder: (context, state) {
                    if (state is ReaderLoaded) {
                      return InteractiveViewer(
                          // panEnabled: false,
                          child: Image.memory(state.image));
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Center(
                          child: const CircularProgressIndicator(),
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
