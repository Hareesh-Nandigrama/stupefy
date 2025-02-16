import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class RecentPlayedTile extends StatelessWidget {
  const RecentPlayedTile({required this.image, required this.title});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: (MediaQuery.of(context).size.width / 1.77) - 45,
      decoration: const BoxDecoration(
        color: MyColors.darGreyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              image: DecorationImage(
                image: AssetImage(
                  "images/$image",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          AutoSizeText(
            title,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontFamily: "AB",
            ),
          )
        ],
      ),
    );
  }
}
