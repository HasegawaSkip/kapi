import 'package:flutter/material.dart';

import 'package:kapi/data/kavita/models/series/series.dart';

class MySeriesScreen extends StatelessWidget {
  final Series series;
  const MySeriesScreen({
    Key? key,
    required this.series,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(series.name!)),
        body: SeriesScreen(series: series));
  }
}

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({
    Key? key,
    required this.series,
  }) : super(key: key);

  final Series series;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(series.name!));
  }
}
