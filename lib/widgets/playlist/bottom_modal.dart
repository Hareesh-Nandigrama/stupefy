import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DraggableScrollableSheet(
        initialChildSize: 0.56,
        minChildSize: 0.56,
        maxChildSize: 0.9,
        expand: false,
        builder:
            (context, scrollController) => SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[800],
                      child: const Icon(
                        Icons.music_note,
                        color: Colors.white54,
                      ),
                    ),
                    title: Text(
                      'Song Title ',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Artist Name #',
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text(
                      'Remove from Your Library',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.download, color: Colors.white),
                    title: Text(
                      'Download',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.add, color: Colors.white),
                    title: Text(
                      'Add to this playlist',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.edit, color: Colors.white),
                    title: Text(
                      'Edit playlist',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.cancel, color: Colors.white),
                    title: Text(
                      'Delete Playlist',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.playlist_add, color: Colors.white),
                    title: Text(
                      'Add to other playlist',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.share, color: Colors.white),
                    title: Text('Share', style: TextStyle(color: Colors.white)),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.person_add_alt_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Invite collaborators',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
