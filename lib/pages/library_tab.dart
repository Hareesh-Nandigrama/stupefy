import 'package:flutter/material.dart';
import 'package:stupefy/widgets/library_tile.dart';

import '../widgets/grid_cell_tile.dart';

class LibraryTab extends StatefulWidget {
  const LibraryTab({super.key});

  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab> {
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("H", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 10),
                Text(
                  "Your Library",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 1,
                    ),
                    child: Text(
                      "Playlists",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 1,
                    ),
                    child: Text(
                      "Artists",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(Icons.recent_actors, color: Colors.white),
          Text(" Recents", style: TextStyle(color: Colors.white)),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            child:
                isGridView
                    ? Icon(Icons.list_sharp, color: Colors.white)
                    : Icon(Icons.widgets, color: Colors.white),
          ),
        ],
      ),
    ),
        Expanded(
          child:
              isGridView
                  ? GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return GridCellTile(
                        index % 2 == 0 ? "Playlist" : "Artist",
                        "Apple",
                        "author",
                      );
                    },
                  )
                  : ListView.builder(
                    itemBuilder: (context, index) {
                      return LibraryTile(
                        index % 2 == 0 ? "Playlist" : "Artist",
                        "Apple",
                        "author",
                      );
                    },
                    itemCount: 20,
                  ),
        ),
      ],
    );
  }
}
