import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kapi/data/kavita/models/series_detail/volume.dart';
import 'package:kapi/logic/cubit/reader_cubit.dart';

class MyReaderScreen extends StatelessWidget {
  final Volume volume;
  const MyReaderScreen({
    Key? key,
    required this.volume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(volume.name!)),
        body: BlocProvider(
          create: (context) => ReaderCubit(),
          // ..getSeriesCoverImage(chapterId: volume.id!, page: 0),
          child: _buildReader(volume: volume),
        ));
  }
}

class _buildReader extends StatelessWidget {
  final Volume volume;
  const _buildReader({
    Key? key,
    required this.volume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderCubit, ReaderState>(
      bloc: ReaderCubit()..getSeriesCoverImage(chapterId: volume.id!, page: 0),
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
                    ..getSeriesCoverImage(chapterId: volume.id!, page: i),
                  builder: (context, state) {
                    if (state is ReaderLoaded) {
                      return InteractiveViewer(
                          // panEnabled: false,
                          child: Image.memory(state.image));
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const Center(child: CircularProgressIndicator()),
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
              Align(child: Text('${volume.pages.toString()} pages')),
              const SizedBox(height: 15),
              const LinearProgressIndicator()
            ],
          ));
        }
      },
    );
  }
}
