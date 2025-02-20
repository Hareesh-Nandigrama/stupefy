import 'package:flutter/material.dart';
import 'package:stupefy/widgets/nav_bar/nav_bar_wrapper.dart';

import '../../widgets/home/home_app_bar.dart';
import '../../widgets/home/home_category_list.dart';
import '../../widgets/home/recent_played_tile.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "/home";
  const HomeScreen({super.key});

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
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return RecentPlayedTile(
                        image: "artists/JID.jpg",
                        title: "china japan nepal bhutan e sala cup namde",
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
