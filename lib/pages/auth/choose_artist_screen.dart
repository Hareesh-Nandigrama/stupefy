import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/playlist_data.dart';
import '../../widgets/onboarding.dart/artist_avatar_widget.dart';
import '../../widgets/onboarding.dart/choose_done_button.dart';
import '../../widgets/onboarding.dart/onboarding_header.dart';
import '../../widgets/search/search_bar.dart';

class ChooseArtistScreen extends StatelessWidget {
  const ChooseArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                OnboardingHeader(title: "Choose 3 or more artists"),
                const SearchBox(),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ArtistAvatar(artist: getArtistList()[index]);
                    }, childCount: getArtistList().length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 175,
                        ),
                  ),
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
        ),
      ),
    );
  }
}

