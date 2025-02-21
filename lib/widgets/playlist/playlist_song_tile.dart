import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../model/playlist_track.dart';
import '../../pages/playlist/song_details_screen.dart';

class PlaylistSongTile extends StatelessWidget {
  final PLaylistTrack song;
  const PlaylistSongTile({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: GestureDetector(
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
      contentPadding: const EdgeInsets.all(0),
      leading: SizedBox(
        height: 48,
        width: 48,
        child: Image.asset('assets/images/${song.image}'),
      ),
      title: SizedBox(
        width: MediaQuery.of(context).size.width - 115,
        child: Text(
          song.trackName,
          style: const TextStyle(fontSize: 16, color: MyColors.whiteColor),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(
        song.singers,
        style: const TextStyle(color: MyColors.lightGrey, fontSize: 13),
      ),
    );
  }
}
