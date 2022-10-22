import 'package:flutter/material.dart';

class buildSectionTitle extends StatelessWidget {
  final String title;

  const buildSectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
