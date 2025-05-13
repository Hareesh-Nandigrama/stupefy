import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../pages/playlist/playlist_screen.dart';
import '../nav_bar/custom_navigator.dart';

class HomeCategoryTile extends StatelessWidget {
  const HomeCategoryTile({super.key, required this.subtitle, required this.artist, required this.image});
  final String subtitle;
  final String artist;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        CustomNavigator.navigateTo(context, PlaylistScreen(playlistName: subtitle, playlistImage: image));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 153,
            width: 153,
            child: Image.asset('assets/images/$image'),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: "AB",
                  fontSize: 12,
                  color: MyColors.whiteColor,
                ),
              ),
              Text(
                "Album . $artist",
                style: TextStyle(
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
