import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:stupefy/widgets/library/library_grid_tile.dart';

import '../../constants/colors.dart';
import '../../store/common_store.dart';
import '../../widgets/library/library_options.dart';
import '../../widgets/library/library_tile.dart';
import '../../widgets/nav_bar/nav_bar_wrapper.dart';
import '../playlist/create_playlist_screen.dart';
import '../profile/setting_screen.dart';
import '../../data/recent_played_data.dart';
import '../../model/recent_played_item.dart';

class LibraryScreen extends StatelessWidget {
  static const String id = "/library";
  LibraryScreen({super.key});
  final List<RecentPlayedItem> recentPlayedItems = getRecentTilesList();

  @override
  Widget build(BuildContext context) {
    var commonStore = Provider.of<CommonStore>(context);
    return NavBarWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              "assets/images/myImage.png",
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Your Library",
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 24,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreatePlaylistScreen(),
                          ),
                        );
                      },
                      child: Image.asset("assets/images/icon_add.png"),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: OptionsList()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/arrow_component_down.png",
                              width: 10,
                              height: 12,
                            ),
                            Image.asset(
                              "assets/images/arrow_component_up.png",
                              width: 10,
                              height: 12,
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "Recently Played",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Image.asset("assets/images/icon_category.png"),
                      onTap: () {
                        commonStore.setLibraryGrid();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Observer(
              builder: (context) {
                return commonStore.isLibraryGrid
                    ? SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.7,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return LibraryGridTile(
                            recentPlayedItem: recentPlayedItems[index],
                          );
                        },
                        childCount: recentPlayedItems.length, // Dynamic number of items
                      ),
                    )
                    : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return LibraryTile(
                            recentPlayedItem: recentPlayedItems[index],
                            size: 35,
                          );
                        },
                        childCount: recentPlayedItems.length, // Dynamic number of items
                      ),
                    );
              },
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 130)),
          ],
        ),
      ),
    );
  }
}
