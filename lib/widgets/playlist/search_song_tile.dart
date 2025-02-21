import 'package:flutter/material.dart';

class SearchSongTile extends StatelessWidget {
  const SearchSongTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        color: Colors.grey[800],
        child: const Icon(Icons.music_note, color: Colors.white54),
      ),
      title: Text('Song Title ', style: TextStyle(color: Colors.white)),
      subtitle: Text('Artist Name #', style: TextStyle(color: Colors.white54)),
      trailing: const Icon(Icons.add_circle_outline, color: Colors.white70),
    );
  }
}
