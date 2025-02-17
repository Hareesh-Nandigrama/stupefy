import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/home/home_app_bar.dart';
import '../../widgets/home/home_category_list.dart';
import '../../widgets/home/recent_played_tile.dart';
import '../../widgets/media_player/bottom_player.dart';

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
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const RecentPlayedTile(
                                    image: "artists/JID.jpg",
                                    title: "JID",
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
                                  const RecentPlayedTile(
                                    image: "home/american-dream.jpg",
                                    title: "american dream",
                                  ),
                                  const RecentPlayedTile(
                                    image: "home/UTOPIA.jpg",
                                    title: "UTOPIA",
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const RecentPlayedTile(
                                    image: "home/Upbeat-Mix.jpg",
                                    title: "Upbeat Mix",
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
                  HomeCategoryList(category: "Jump back in"),
                  HomeCategoryList(category: "Your top mixes"),
                  HomeCategoryList(category: "Recently Played"),
                  SliverPadding(padding: EdgeInsets.only(bottom: 100)),
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