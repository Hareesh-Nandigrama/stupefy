import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../widgets/library/library_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                          fontFamily: "AM",
                          fontWeight: FontWeight.w400,
                          color: MyColors.whiteColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),

                   LibraryTile(
                    isArtist: true,
                    image: 'Doja-Cat.jpg',
                    title: "Doja Cat",
                    size: 23,
                    isDeletable: true,
                  ),
                  LibraryTile(
                    image: "AUSTIN.jpg",
                    author: 'Post Malone',
                    title: "Laugh It Off",
                    size: 47,
                    isArtist: false,
                    isDeletable: true,
                  ),
                   LibraryTile(
                    isArtist: true,
                    image: 'Doja-Cat.jpg',
                    title: "Doja Cat",
                    size: 23,
                    isDeletable: true,
                  ),
                   LibraryTile(
                    isArtist: true,
                    image: 'Doja-Cat.jpg',
                    title: "Doja Cat",
                    size: 23,
                    isDeletable: true,
                  ),

                  LibraryTile(
                    image: "AUSTIN.jpg",
                    author: 'Post Malone',
                    title: "Laugh It Off",
                    size: 47,
                    isArtist: false,
                    isDeletable: true,
                  ),
                   LibraryTile(
                    isArtist: true,
                    image: 'Doja-Cat.jpg',
                    title: "Doja Cat",
                    size: 23,
                    isDeletable: true,
                  ),
                  LibraryTile(
                    image: "AUSTIN.jpg",
                    author: 'Post Malone',
                    title: "Laugh It Off",
                    size: 47,
                    isArtist: false,
                    isDeletable: true,
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
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
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
                          fontFamily: "AM",
                          fontSize: 16,
                          color: MyColors.whiteColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, left: 15),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontFamily: "AM",
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
                style: TextStyle(
                    fontFamily: "AM", color: MyColors.whiteColor, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
