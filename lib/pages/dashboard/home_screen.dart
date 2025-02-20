import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/home/home_app_bar.dart';
import '../../widgets/home/home_category_list.dart';
import '../../widgets/home/recent_played_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 55,
                              ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return RecentPlayedTile(
                              image: "artists/JID.jpg",
                              title:
                                  "china japan nepal bhutan e sala cup namde",
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
          ],
        ),
      ),
    );
  }
}
