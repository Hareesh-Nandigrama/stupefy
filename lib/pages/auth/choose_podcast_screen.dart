import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/playlist_data.dart';
import '../../widgets/onboarding.dart/choose_done_button.dart';
import '../../widgets/onboarding.dart/onboarding_header.dart';
import '../../widgets/onboarding.dart/podcast_avatar_widget.dart';
import '../../widgets/search/search_bar.dart';

class ChoosePodcastScreen extends StatelessWidget {
  const ChoosePodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darGreyColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                OnboardingHeader(title: "Now choose some podcasts"),
                const SearchBox(),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 90,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return PodcastAvatarWidget(
                        podcast: getPodcastList()[index],
                      );
                    }, childCount: getPodcastList().length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 165,
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
            ChooseDoneButton(isArtist: false),
          ],
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
        padding: const EdgeInsets.only(bottom: 35, right: 25, left: 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 42,
          decoration: const BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Image.asset("assets/images/icon_Search.png"),
                const Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 16,
                      color: MyColors.blackColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15, left: 15),
                      hintText: "Search",
                      hintStyle: TextStyle(
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
