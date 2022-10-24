import 'package:flutter/material.dart';
import 'package:kapi/data/kavita/models/series.dart';

import '../series_detail_screen.dart';

class SeriesCard extends StatelessWidget {
  final String title;
  final ImageProvider coverImage;
  final Series? series;

  const SeriesCard(
      {Key? key, this.series, required this.title, required this.coverImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3.5;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: width,
        height: width * 1.6,
        decoration: BoxDecoration(
          image: DecorationImage(image: coverImage, fit: BoxFit.cover),
        ),
        child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.20,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  decoration: const BoxDecoration(color: Colors.black54),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            title,
                            style: const TextStyle(color: Colors.white)),
                      ),
                      (series != null)
                          ? Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTapDown: (details) {
                                  _showMenu(
                                      context, details.globalPosition, series!);
                                },
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Future<String?> _showMenu(
    BuildContext context, Offset globalPosition, Series series) {
  double left = globalPosition.dx - 200;
  double top = globalPosition.dy + 20;

  return showMenu(
    context: context,
    position: RelativeRect.fromLTRB(left, top, 0, 0),
    items: [
      PopupMenuItem<String>(
          onTap: () {
            Future(() => Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => MySeriesScreen(series)))));
          },
          value: '0',
          child: const Text('Open Series')),
      PopupMenuItem<String>(value: '1', child: const Text('Mark as Read')),
      PopupMenuItem<String>(
          child: const Text('Add to Want to Read'), value: '2'),
    ],
  );
}
