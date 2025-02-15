import 'package:flutter/material.dart';

class LibraryTile extends StatelessWidget {
  final String type;
  final String title;
  final String author;

  const LibraryTile(this.type, this.title, this.author, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          type == "Artist"
              ? CircleAvatar(radius: 30, backgroundColor: Colors.blue,)
              : Container(height: 60, width: 60, color: Colors.grey),
      title: Text(title),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(type), type == "Playlist" ? Text(author) : Container()],
      ),
      subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 13),
    );
  }
}
