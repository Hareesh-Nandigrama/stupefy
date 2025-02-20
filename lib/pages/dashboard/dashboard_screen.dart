import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import '../../data/playlist_data.dart';
import '../../store/common_store.dart';
import '../playlist/playlist_screen.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import '../../widgets/home/nav_bar.dart';
import 'search/search_category_screen.dart';

class DashBoardScreen extends StatefulWidget {
  
  const DashBoardScreen({
    super.key,
  });

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     var commonStore = context.read<CommonStore>();
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: NavBar(),
      body: Observer(
        builder: (BuildContext context){
          switch (commonStore.dashboardPage) {
            case DashboardPageType.library:
              return LibraryScreen();
            case DashboardPageType.search:
              return SearchCategoryScreen();
            default:
              return Home();
          }
        },
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
