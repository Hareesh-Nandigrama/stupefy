import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../pages/playlist/playlist_screen.dart';
import '../nav_bar/custom_navigator.dart';

// ignore: must_be_immutable
class LibraryTile extends StatelessWidget {
  LibraryTile({
    super.key,
    this.author,
    required this.image,
    required this.title,
    required this.size,
    required this.isDeletable,
    required this.isArtist,
  });
  final String image;
  String? author;
  final String title;
  final double size;
  final bool isDeletable;
  final bool isArtist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        CustomNavigator.navigateTo(context, PlaylistScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                isArtist
                    ? CircleAvatar(
                      radius: size,
                      backgroundImage: AssetImage("assets/images/artists/$image"),
                    )
                    : SizedBox(
                      height: size,
                      width: size,
                      child: Image.asset('assets/images/home/$image'),
                    ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                         
                        fontSize: 15,
                        color: MyColors.whiteColor,
                      ),
                    ),
                    isArtist
                        ? Text(
                          "Artist",
                          style: TextStyle(
                             
                            fontSize: 13,
                            color: MyColors.lightGrey,
                          ),
                        )
                        : Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 13,
                                  width: 13,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffC4C4C4),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "E",
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: MyColors.blackColor,
                                     
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Playlist . $author",
                              style: const TextStyle(
                                 
                                fontSize: 13,
                                color: MyColors.lightGrey,
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: isDeletable,
              child: Image.asset(
                'assets/images/icon_back.png',
                height: 14,
                width: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
