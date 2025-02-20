import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/media_player/bottom_player.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: BottomPlayer(),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: MyColors.blackColor.withOpacity(0.95),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedLabelStyle: const TextStyle(
                fontFamily: "AM",
                fontSize: 13,
              ),
              selectedItemColor: const Color(0xffE5E5E5),
              unselectedItemColor: MyColors.lightGrey,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icon_home.png'),
                  activeIcon: Image.asset('assets/images/icon_home_active.png'),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icon_search_bottomnav.png'),
                  activeIcon: Image.asset(
                    'assets/images/icon_search_active.png',
                    color: MyColors.whiteColor,
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_library.png',
                    color: MyColors.lightGrey,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/icon_library_active.png',
                    color: MyColors.whiteColor,
                  ),
                  label: "Your Library",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
