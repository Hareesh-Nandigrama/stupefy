import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../model/playlist_track.dart';
import 'bottom_modal.dart';

class PlaylistSongTile extends StatelessWidget {
  final PLaylistTrack song;
  const PlaylistSongTile({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => const BottomModal(),
          );
        },
        child: Icon(Icons.more_vert, color: MyColors.lightGrey),
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
