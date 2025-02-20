import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../pages/playlist/playlist_screen.dart';
import '../nav_bar/custom_navigator.dart';

class RecentPlayedTile extends StatelessWidget {
  const RecentPlayedTile({super.key, required this.image, required this.title});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        CustomNavigator.navigateTo(context, PlaylistScreen());
      },
      child: Container(
        height: 55,
        width: (MediaQuery.of(context).size.width / 1.77) - 45,
        decoration: const BoxDecoration(
          color: MyColors.darGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
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
                  image: AssetImage("assets/images/$image"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontFamily: "AB",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
