import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../widgets/library/library_tile.dart';
import '../../../model/recent_played_item.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap outside
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          FocusScope.of(context).unfocus(); // Dismiss keyboard on scroll
          return false;
        },
        child: Scaffold(
          backgroundColor: MyColors.blackColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  const _SearchBox(),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 20),
                      child: Text(
                        "Recent searches",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: MyColors.whiteColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      return LibraryTile(
                        recentPlayedItem: RecentPlayedItem(
                          image: 'artists/Doja-Cat.jpg',
                          title: "Doja Cat",
                          author: "Doja Cat",
                          isArtist: true,
                        ),
                        size: 23,
                      );
                    }, childCount: 7),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width - 102.5,
              decoration: const BoxDecoration(
                color: Color(0xff282828),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/icon_search_transparent.png",
                      color: MyColors.whiteColor,
                    ),
                    const Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16,
                          color: MyColors.whiteColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, left: 15),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: MyColors.whiteColor,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.none,
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: MyColors.whiteColor, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
