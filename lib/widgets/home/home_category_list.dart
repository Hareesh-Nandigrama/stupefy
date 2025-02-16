import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../data/playlist_data.dart';
import '../../pages/playlist/playlist_screen.dart';
import 'home_category_tile.dart';

class HomeCategoryWidget extends StatelessWidget {
  final String category;
  const HomeCategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                fontFamily: "AB",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: MyColors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaylistScreen(
                            cover: "Upbeat-Mix.jpg",
                            playlist: trackList("Drake mix"),
                          ),
                        ),
                      );
                    },
                    child: HomeCategoryTile(
                      subtitle: "Upbeat Mix",
                      image: "Upbeat-Mix.jpg",
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
