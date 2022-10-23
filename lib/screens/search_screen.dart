import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapi/data/kavita/models/libraryDto.dart';
import 'package:kapi/logic/cubit/library_cubit.dart';
import 'package:kapi/screens/series_list_screen.dart';

import '../data/kavita/models/library.dart';

class MySearchScreen extends StatelessWidget {
  const MySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LibraryCubit()..getLibraryNames(),
      child: _buildSearchScreen(),
    );
  }
}

class _buildSearchScreen extends StatelessWidget {
  const _buildSearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<LibraryCubit>().getLibraryNames(),
      child: BlocBuilder<LibraryCubit, LibraryState>(
        builder: (context, state) {
          if (state is LibraryInfoLoaded) {
            // return Text(LibraryInfoLoaded(state.libraryNames).toString());
            return ListView.separated(
                itemCount: state.libraryNames.length,
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                    ),
                itemBuilder: (context, index) {
                  final LibraryDto library = state.libraryNames[index];

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>
                              MySeriesListScreen(library: library))));
                      // print(library.id);
                    },
                    // leading: FaIcon(FontAwesomeIcons.bookOpen),
                    leading: FaIcon(getLibraryTypeIcon(
                        format: LibraryType.values[library.type!])),
                    title: Text(library.name!),
                  );
                });
          }
          if (state is LibraryLoading) {
            return const Center(child: LinearProgressIndicator());
            // return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text('All'),
                      onTap: (() => print('All')),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

getLibraryTypeIcon({format: LibraryType}) {
  switch (format) {
    case LibraryType.Book:
      return FontAwesomeIcons.book; // fa-book
    case LibraryType.Comic:
    case LibraryType.Manga:
      return FontAwesomeIcons.bookOpen; // 'fa-book-open'
  }
}

// home Home
// star Want To Read
// list Collections
// list-ol Reading Lists
// bookmark Bookmarks
// fa fa-rectangle-list fa-regular All Series
