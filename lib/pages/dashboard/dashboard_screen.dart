import 'package:flutter/material.dart';

import '../../data/playlist_data.dart';
import '../playlist/playlist_screen.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'nav_bar.dart';
import 'search/search_category_screen.dart';

class DashBoardScreen extends StatefulWidget {
  final int initialIndex;
  
  const DashBoardScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [Home(), SearchCategoryScreen(), LibraryScreen()],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  // When navigating to PlaylistScreen:
  Future<void> navigateToPlaylistScreen() async {
    final int? result = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) => PlaylistScreen(
          cover: "Upbeat-Mix.jpg",
          playlist: trackList("Drake mix"),
          initialIndex: _currentIndex,
        ),
      ),
    );

    // Debug print to verify the returned value
    print('Returned index: $result');

    // When PlaylistScreen pops and returns an index
    if (result != null) {
      setState(() {
        _currentIndex = result;
        // Debug print to verify state update
        print('Updated currentIndex to: $_currentIndex');
      });
    }
  }
}
