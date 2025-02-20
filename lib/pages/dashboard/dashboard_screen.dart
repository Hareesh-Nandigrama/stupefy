import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'library_screen.dart';
import 'nav_bar.dart';
import 'search/search_category_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

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
}
