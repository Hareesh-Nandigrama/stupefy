import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/media_player/bottom_player.dart';
import '../../widgets/library/library_options.dart';
import '../../widgets/library/library_tile.dart';
import '../profile/profile_screen.dart';
import '../profile/setting_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
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
                                  backgroundImage:
                                      AssetImage("images/myImage.png"),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
                                ),
                              );
                            },
                            child: Image.asset("images/icon_add.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: OptionsList(),
                  ),
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
                                    "images/arrow_component_down.png",
                                    width: 10,
                                    height: 12,
                                  ),
                                  Image.asset(
                                    "images/arrow_component_up.png",
                                    width: 10,
                                    height: 12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Recently Played",
                                style: TextStyle(
                                  fontFamily: "AM",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          Image.asset("images/icon_category.png"),
                        ],
                      ),
                    ),
                  ),

                  LibraryTile(
                    image: '21-Savage.jpg',
                    title: "21 Savage",
                    size: 35,
                    isDeletable: false,
                    isArtist: true,
                  ),
                  LibraryTile(
                    image: "UTOPIA.jpg",
                    author: 'China',
                    title: "Playlist fav",
                    size: 47,
                    isDeletable: false,
                    isArtist: false,
                  ),
                  LibraryTile(
                    image: "Post-Malone.jpg",
                    title: "Post Malone",
                    size: 35,
                    isArtist: true,
                    isDeletable: false,
                  ),
                  LibraryTile(
                    image: "J-Cole.jpg",
                    title: "J Cole",
                    size: 35,
                    isDeletable: false,
                    isArtist: true,
                  ),
                  LibraryTile(
                    image: "UTOPIA.jpg",
                    author: 'China',
                    title: "Playlist fav",
                    size: 47,
                    isDeletable: false,
                    isArtist: false,
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 130),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 94),
              child: BottomPlayer(),
            ),
          ],
        ),
      ),
    );
  }
}


