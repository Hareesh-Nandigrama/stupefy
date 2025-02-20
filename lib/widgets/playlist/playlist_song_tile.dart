import 'package:flutter/material.dart';
import 'package:stupefy/model/playlist_track.dart';

import '../../constants/colors.dart';
import '../../pages/playlist/song_details_screen.dart';

class PlaylistSongTile extends StatelessWidget {
  final PLaylistTrack song;
  const PlaylistSongTile({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 48,
                width: 48,
                child: Image.asset('assets/images/${song.image}'),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 115,
                    child: Text(
                      song.trackName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: MyColors.whiteColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    song.singers,
                    style: const TextStyle(
                      color: MyColors.lightGrey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SongDetailsScreen(
                        trackName: song.trackName,
                        color: Colors.blue,
                        singer: song.singers,
                        albumImage: song.image,
                      ),
                ),
              );
            },
            child: Image.asset("assets/images/icon_more.png"),
          ),
        ],
      ),
    );
  }
}
