import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../data/playlist_data.dart';
import '../../pages/playlist/playlist_screen.dart';

class RecentPlayedTile extends StatelessWidget {
  const RecentPlayedTile({required this.image, required this.title});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistScreen(
              cover: "Upbeat-Mix.jpg",
              playlist: trackList("Drake mix"),
            ),
          ),
        );
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
                  image: AssetImage("images/$image"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return AutoSizeText(
                    title,
                    maxLines: 2,
                    overflowReplacement: Text(
                      _truncateTitle(title),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontFamily: "AB",
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontFamily: "AB",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _truncateTitle(String title) {
  if (title.length <= 15) return title;
  return "${title.substring(0, 14)}\n${title.substring(14, 27)}...";
}
