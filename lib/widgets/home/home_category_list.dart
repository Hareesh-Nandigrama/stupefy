import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'home_category_tile.dart';

class HomeCategoryList extends StatelessWidget {
  final String category;
  final List<Map<String, String>> items;

  const HomeCategoryList({
    super.key,
    required this.category,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 20),
            child: Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 199,
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = items[index];
                return Row(
                  children: [
                    HomeCategoryTile(
                      subtitle: item["albumTitle"]!,
                      artist: item["artistName"]!,
                      image: item["albumImage"]!,
                    ),
                    const SizedBox(width: 15),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
