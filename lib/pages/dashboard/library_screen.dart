import 'package:flutter/material.dart';
import 'package:stupefy/pages/playlist/create_playlist_screen.dart';
import 'package:stupefy/widgets/nav_bar/nav_bar_wrapper.dart';

import '../../constants/colors.dart';
import '../../widgets/library/library_options.dart';
import '../../widgets/library/library_tile.dart';
import '../profile/profile_screen.dart';
import '../profile/setting_screen.dart';

class LibraryScreen extends StatelessWidget {
  static const String id = "/library";
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  CreatePlaylistScreen()));
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
                    Image.asset("assets/images/icon_category.png"),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return LibraryTile(
                    image: '21-Savage.jpg',
                    title: "21 Savage",
                    size: 35,
                    isDeletable: false,
                    isArtist: true,
                  );
                },
                childCount: 10, // Dynamic number of items
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 130)),
          ],
        ),
      ),
    );
  }
}
