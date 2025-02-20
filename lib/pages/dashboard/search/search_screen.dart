import 'package:flutter/material.dart';
import 'package:stupefy/widgets/nav_bar/nav_bar_wrapper.dart';

import '../../../constants/colors.dart';
import '../../../widgets/search/search_bar.dart';
import '../../../widgets/search/search_page_tile.dart';

class SearchScreen extends StatefulWidget {
    static const String id = "/search";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return NavBarWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Search",
                      style: TextStyle(
                        fontFamily: "AB",
                        fontSize: 25,
                        color: MyColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SearchBox(),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 17, bottom: 17),
                child: Text(
                  "Your top genres",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: MyColors.whiteColor,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchPageTile(title: "", image: "pop.png"),
                  SearchPageTile(title: "", image: "indie.png"),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  "Popular podcast categories",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: MyColors.whiteColor,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width / 1.75) - 50,
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/news&politics.png"),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        left: 10,
                        child: SizedBox(
                          width: 72,
                          child: Text(
                            "News & Politics",
                            style: TextStyle(
                              fontFamily: "AB",
                              fontSize: 16,
                              color: MyColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SearchPageTile(title: "Comdey", image: "comedy.png"),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  "Browse all",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: MyColors.whiteColor,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchPageTile(
                    title: "2023 Wrapped",
                    image: "2023_wrapped.png",
                  ),
                  SearchPageTile(title: "Podcasts", image: "podcasts.png"),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchPageTile(
                      title: "Made for you",
                      image: "made_for_you.png",
                    ),
                    SearchPageTile(title: "Charts", image: "charts.png"),
                  ],
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 180)),
          ],
        ),
      ),
    );
  }
}
