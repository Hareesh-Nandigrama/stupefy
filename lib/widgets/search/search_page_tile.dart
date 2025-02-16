import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class SearchPageTile extends StatelessWidget {
  const SearchPageTile({required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: (MediaQuery.of(context).size.width / 1.75) - 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/$image"),
              fit: BoxFit.cover,
            ),
            color: Colors.red,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: "AB",
              fontSize: 16,
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}