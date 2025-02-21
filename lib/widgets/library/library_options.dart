import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class LibraryOptionsChip extends StatelessWidget {
  const LibraryOptionsChip({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    List<String> chipTitle = [
      "Playlists",
      "Artists",
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            height: 33,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.lightGrey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  chipTitle[index],
                  style: const TextStyle(
                     
                    fontSize: 12,
                    color: MyColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsList extends StatelessWidget {
  const OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return LibraryOptionsChip(index: index);
        },
      ),
    );
  }
}