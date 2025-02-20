import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/playlist_data.dart';
import '../../pages/playlist/playlist_screen.dart';

class HomeCategoryTile extends StatelessWidget {
  const HomeCategoryTile({super.key, required this.subtitle, required this.image});
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => PlaylistScreen(
                  cover: "Upbeat-Mix.jpg",
                  playlist: trackList("Drake mix"),
                ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 153,
            width: 153,
            child: Image.asset("assets/images/home/UTOPIA.jpg"),
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "UTOPIA",
                style: TextStyle(
                  fontFamily: "AB",
                  fontSize: 12,
                  color: MyColors.whiteColor,
                ),
              ),
              Text(
                "Album . Travis Scott",
                style: TextStyle(
                  fontFamily: "AM",
                  fontSize: 12.5,
                  color: MyColors.lightGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
