import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:stupefy/constants/enums.dart';
import 'package:stupefy/pages/dashboard/home_screen.dart';
import 'package:stupefy/pages/dashboard/library_screen.dart';
import 'package:stupefy/pages/dashboard/search/search_screen.dart';
import 'package:stupefy/widgets/nav_bar/custom_navigator.dart';

import '../../constants/colors.dart';
import '../../store/common_store.dart';
import '../media_player/bottom_player.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var commonStore = context.read<CommonStore>();

    return Observer(
      builder: (context) {
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
                     
                    fontSize: 13,
                  ),
                  selectedItemColor: const Color(0xffE5E5E5),
                  unselectedItemColor: MyColors.lightGrey,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: commonStore.dashboardPage.index,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  onTap: (index) {
                    commonStore.setDashboardIndex(
                      DashboardPageType.values[index],
                    );
                    CustomNavigator.navigateTo(
                      context,
                      index == 0
                          ? HomeScreen()
                          : index == 1
                          ? SearchScreen()
                          : LibraryScreen(),
                    );
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset('assets/images/icon_home.png'),
                      activeIcon: Image.asset(
                        'assets/images/icon_home_active.png',
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/images/icon_search_bottomnav.png',
                      ),
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
      },
    );
  }
}
