import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../pages/dashboard/search/search_screen.dart';

class SearchBox extends StatelessWidget {
  const SearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 46,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: MyColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: Row(
              children: [
                Image.asset("images/icon_search_black.png"),
                const SizedBox(width: 15),
                const Text(
                  "What do you want to listen to?",
                  style: TextStyle(
                    fontFamily: "AB",
                    color: MyColors.darGreyColor,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}