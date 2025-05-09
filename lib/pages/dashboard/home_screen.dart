import 'package:flutter/material.dart';
import 'package:stupefy/widgets/nav_bar/nav_bar_wrapper.dart';
import '../../models/recent_played_item.dart';

import '../../widgets/home/home_app_bar.dart';
import '../../widgets/home/home_category_list.dart';
import '../../widgets/home/recent_played_tile.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "/home";
  HomeScreen({super.key});

  // Dummy data simulating API response
  final List<RecentPlayedItem> recentPlayedItems = [
    RecentPlayedItem(
      image: "artists/JID.jpg",
      title: "The Forever Story",
    ),
    RecentPlayedItem(
      image: "artists/Eminem.jpg",
      title: "Mr. Morale & The Big Steppers",
    ),
    RecentPlayedItem(
      image: "artists/Drake.jpg",
      title: "Her Loss",
    ),
    RecentPlayedItem(
      image: "artists/Adele.jpg",
      title: "Utopia",
    ),
    RecentPlayedItem(
      image: "artists/JID.jpg",
      title: "After Hours",
    ),
    RecentPlayedItem(
      image: "artists/Taylor-Swift.jpg",
      title: "Blonde",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NavBarWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppBar(),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 55,
                    ),
                    itemCount: recentPlayedItems.length,
                    itemBuilder: (context, index) {
                      final item = recentPlayedItems[index];
                      return RecentPlayedTile(
                        image: item.image,
                        title: item.title,
                      );
                    },
                  ),
                ],
              ),
            ),
            HomeCategoryList(category: "Jump back in"),
            HomeCategoryList(category: "Your top mixes"),
            HomeCategoryList(category: "Recently Played"),
            SliverPadding(padding: EdgeInsets.only(bottom: 180)),
          ],
        ),
      ),
    );
  }
}
