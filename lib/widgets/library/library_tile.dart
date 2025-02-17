import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../data/playlist_data.dart';
import '../../pages/playlist/playlist_screen.dart';

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
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => PlaylistScreen(
                    cover: "Upbeat-Mix.jpg",
                    playlist: trackList("Drake mix"),
                  ),
            ),
          );
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
                        backgroundImage: AssetImage("images/artists/$image"),
                      )
                      : SizedBox(
                        height: size,
                        width: size,
                        child: Image.asset('images/home/$image'),
                      ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: "AM",
                          fontSize: 15,
                          color: MyColors.whiteColor,
                        ),
                      ),
                      isArtist
                          ? Text(
                            "Artist",
                            style: TextStyle(
                              fontFamily: "AM",
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
                                      fontFamily: "AM",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Playlist . $author",
                                style: const TextStyle(
                                  fontFamily: "AM",
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
                  'images/icon_back.png',
                  height: 14,
                  width: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
