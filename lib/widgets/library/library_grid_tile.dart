import 'package:flutter/material.dart';
import 'package:stupefy/pages/playlist/playlist_screen.dart';
import 'package:stupefy/widgets/nav_bar/custom_navigator.dart';
import '../../model/recent_played_item.dart';

class LibraryGridTile extends StatelessWidget {
  const LibraryGridTile({
    super.key,
    required this.recentPlayedItem,
  });

  final RecentPlayedItem recentPlayedItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomNavigator.navigateTo(
          context,
          PlaylistScreen(playlistName: recentPlayedItem.title, playlistImage: recentPlayedItem.image),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset("assets/images/${recentPlayedItem.image}", fit: BoxFit.cover),
          ),
          const SizedBox(height: 8.0),
          Text(
            recentPlayedItem.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            'Playlist • ${recentPlayedItem.author}',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
