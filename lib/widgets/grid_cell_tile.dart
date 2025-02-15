import 'package:flutter/material.dart';

class GridCellTile extends StatelessWidget {
  final String type;
  final String title;
  final String author;

  const GridCellTile(this.type, this.title, this.author,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      type == "Artist"
          ? CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
            )
          : Container(
              height: 80,
              width: 80,
              color: Colors.grey,
            ),
      Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(type, style: TextStyle(color: Colors.white, fontSize: 12),),
          type == "Playlist" ? Text(author, style: TextStyle(color: Colors.white, fontSize: 12),) : Container()
        ],
      ),
    ],);
  }
}