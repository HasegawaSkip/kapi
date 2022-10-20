import 'package:flutter/material.dart';

class SeriesCard extends StatelessWidget {
  final String title;
  final ImageProvider coverImage; //NetworkImage or AssetImage

  const SeriesCard({Key? key, required this.title, required this.coverImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
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
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          title,
                          style: const TextStyle(color: Colors.white)),
                    ),
                    GestureDetector(
                      onTapDown: (details) =>
                          _showMenu(context, details.globalPosition),
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    )
//                       )
                  ],
                ))),
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
