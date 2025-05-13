import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../pages/playlist/playlist_screen.dart';
import '../nav_bar/custom_navigator.dart';
import '../../model/recent_played_item.dart';

// ignore: must_be_immutable
class LibraryTile extends StatelessWidget {
  const LibraryTile({
    super.key,
    required this.recentPlayedItem,
    required this.size,
  });
  final RecentPlayedItem recentPlayedItem;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomNavigator.navigateTo(context, PlaylistScreen(playlistName: recentPlayedItem.title, playlistImage: recentPlayedItem.image));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading:
            recentPlayedItem.isArtist
                ? CircleAvatar(
                  radius: size,
                  backgroundImage: AssetImage("assets/images/${recentPlayedItem.image}"),
                )
                : SizedBox(
                  height: size,
                  width: size,
                  child: Image.asset('assets/images/${recentPlayedItem.image}'),
                ),
        title: Text(
          recentPlayedItem.title,
          style: const TextStyle(fontSize: 15, color: MyColors.whiteColor, overflow: TextOverflow.ellipsis),
        ),
        subtitle:
            !recentPlayedItem.isArtist
                ? Text(
                  "Artist",
                  style: TextStyle(fontSize: 13, color: MyColors.lightGrey, overflow: TextOverflow.ellipsis),
                )
                : Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 13,
                          width: 13,
                          decoration: const BoxDecoration(
                            color: Color(0xffC4C4C4),
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                        ),
                        const Text(
                          "E",
                          style: TextStyle(
                            fontSize: 8,
                            color: MyColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Playlist . ${recentPlayedItem.author}",
                      style: const TextStyle(
                        fontSize: 13,
                        color: MyColors.lightGrey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
