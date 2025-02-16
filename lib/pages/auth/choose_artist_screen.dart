import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../model/artist.dart';
import '../../widgets/onboarding.dart/artist_avatar_widget.dart';
import '../../widgets/onboarding.dart/choose_done_button.dart';
import '../../widgets/onboarding.dart/onboarding_header.dart';


getArtistList() {
    return [
      Artist(
        "21-Savage.jpg",
        "21 Savage",
      ),
      Artist(
        "Adele.jpg",
        "Adele",
      ),
      Artist(
        "Cardi-B.jpg",
        "Cardi B",
      ),
      Artist(
        "DaBaby.jpg",
        "DaBaby",
      ),
      Artist(
        "Doja-Cat.jpg",
        "Doja Cat",
      ),
      Artist(
        "Drake.jpg",
        "Drake",
      ),
      Artist(
        "Eminem.jpg",
        "Eminem",
      ),
      Artist(
        "Future.jpg",
        "Future",
      ),
      Artist(
        "J-Cole.jpg",
        "J Cole",
      ),
      Artist(
        "Ice-Cube.jpg",
        "Ice Cube",
      ),
      Artist(
        "JAY-Z.jpg",
        "Jay z",
      ),
      Artist(
        "JID.jpg",
        "JID",
      ),
      Artist(
        "Kanye-West.jpg",
        "Kanye West",
      ),
      Artist(
        "Kendrick-Lamar.jpg",
        "Kenderick Lamar",
      ),
      Artist(
        "Lil Baby.jpg",
        "Lil Baby",
      ),
      Artist(
        "Lil-Wayne.jpg",
        "Lil Wayne",
      ),
      Artist(
        "Megan-Thee-Stallion.jpg",
        "Megan Thee Stallion",
      ),
      Artist(
        "Metro-Boomin.jpg",
        "Metro Boomin",
      ),
      Artist(
        "Nicki-Minaj.jpg",
        "Nicki Minaj",
      ),
      Artist(
        "Post-Malone.jpg",
        "Post Malone",
      ),
      Artist(
        "Selena-Gomez.jpg",
        "Selena Gomez",
      ),
      Artist(
        "Snoop Dogg.jpg",
        "Snoop Dogg",
      ),
      Artist(
        "Taylor-Swift.jpg",
        "Taylor Swift",
      ),
      Artist(
        "Travis-Scott.jpg",
        "Travis Scott",
      ),
      Artist(
        "Tyler-The-Creator.jpg",
        "Tyler The Creator",
      ),
    ];
  }
class ChooseArtistScreen extends StatelessWidget {
  const ChooseArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      body: SafeArea(
        child:               Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CustomScrollView(
                    slivers: [
                      OnboardingHeader(title: "Choose 3 or more artists"),
                      const _SearchBox(),
                      _AvatarsSection(
                        artist: getArtistList()
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          MyColors.blackColor.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  ChooseDoneButton(isArtist: true),
                ],
              )
      ),
    );
  }
}


class _AvatarsSection extends StatelessWidget {
  const _AvatarsSection({required this.artist});
  final List<Artist> artist;
  

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ArtistAvatar(
              artist: artist[index],
            );
          },
          childCount: artist.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 175,
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 25, left: 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 42,
          decoration: const BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Image.asset("images/icon_Search.png"),
                const Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 16,
                      color: MyColors.blackColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15, left: 15),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontFamily: "AM",
                        color: MyColors.blackColor,
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
