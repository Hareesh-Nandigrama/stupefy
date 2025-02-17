import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'home_category_tile.dart';

class HomeCategoryList extends StatelessWidget {
  final String category;
  const HomeCategoryList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                fontFamily: "AB",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: MyColors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HomeCategoryTile(
                    subtitle: "Upbeat Mix",
                    image: "Upbeat-Mix.jpg",
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
