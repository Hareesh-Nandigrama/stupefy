import 'package:flutter/material.dart';


import '../../constants/constants.dart';
import '../../data/playlist_data.dart';
import '../../widgets/home/home_app_bar.dart';
import '../../widgets/home/home_category_list.dart';
import '../../widgets/home/recent_played_tile.dart';
import '../../widgets/media_player/bottom_player.dart';
import '../playlist/playlist_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          HomeAppBar(),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 55,
                                    width: (MediaQuery.of(context).size.width /
                                            1.77) -
                                        45,
                                    decoration: const BoxDecoration(
                                      color: MyColors.darGreyColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Container(
                                              height: 55,
                                              width: 55,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                ),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "images/liked_songs.png",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              'images/icon_heart_white.png',
                                              height: 20,
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Liked Songs",
                                          style: TextStyle(
                                            fontFamily: "AB",
                                            fontSize: 12,
                                            color: MyColors.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const RecentPlayedTile(
                                    image: "artists/JID.jpg",
                                    title: "JID",
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlaylistScreen(
                                            cover: "Upbeat-Mix.jpg",
                                            playlist: trackList("Drake mix"),
                                          ),
                                      ));
                                    },
                                    child: const RecentPlayedTile(
                                      image: "home/american-dream.jpg",
                                      title: "american",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlaylistScreen(
                                            cover: "Upbeat-Mix.jpg",
                                            playlist: trackList("Drake mix"),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const RecentPlayedTile(
                                      image: "home/UTOPIA.jpg",
                                      title: "UTOPIA",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PlaylistScreen(
                                            cover: "Upbeat-Mix.jpg",
                                            playlist: trackList("Drake mix"),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const RecentPlayedTile(
                                      image: "home/Upbeat-Mix.jpg",
                                      title: "Upbeat Mix",
                                    ),
                                  ),
                                  const RecentPlayedTile(
                                    image: "home/Daily-Mix-1.jpg",
                                    title: "Daily Mix",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  HomeCategoryWidget(category: "Jump back in"),
                  HomeCategoryWidget(category: "Your top mixes"),
                  HomeCategoryWidget(category: "Recently Played"),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 100),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 88),
              child: BottomPlayer(),
            ),
          ],
        ),
      ),
    );
  }
}
