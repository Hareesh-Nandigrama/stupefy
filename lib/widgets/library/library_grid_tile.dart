import 'package:flutter/material.dart';

class LibraryGridTile extends StatelessWidget {
  const LibraryGridTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Image.asset("assets/images/artists/21-Savage.jpg"),
        ),
        const SizedBox(height: 8.0),
        const Text(
          '21 Savage',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Text(
          'Playlist • Owner',
          style: TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }
}
