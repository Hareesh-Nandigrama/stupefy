import 'package:flutter/material.dart';


import '../../constants/constants.dart';
import '../../model/podcast.dart';
import '../../widgets/onboarding.dart/choose_done_button.dart';
import '../../widgets/onboarding.dart/onboarding_header.dart';
import '../../widgets/onboarding.dart/podcast_avatar_widget.dart';

getPodcastList() {
    return [
      Podcast(
        "The-Joe-Rogan-Experience.jpg",
        "The Joe Rogan Experience",
      ),
      Podcast(
        "The-Iced-coffe-hour.jpg",
        "The Iced Coffe Hour",
      ),
      Podcast(
        "Startalk.jpg",
        "StarTalk Radio",
      ),
      Podcast(
        "shxts-ngigs.jpg",
        "ShxtsNGigs",
      ),
      Podcast(
        "podcast-p.jpg",
        "Podcast P",
      ),
      Podcast(
        "NFR-Podcast.jpg",
        "NFR Podcast",
      ),
      Podcast(
        "Modern-Wisdom.jpg",
        "Modern Wisdom",
      ),
      Podcast(
        "Huberman-Lab.jpg",
        "Huberman Lab",
      ),
      Podcast(
        "Fresh&Fit.jpg",
        "Fresh&Fit Podcast",
      ),
      Podcast(
        "Distractible.jpg",
        "Distractible",
      ),
      Podcast(
        "JordanB.Peterson-Podcast.jpg",
        "The Jordan B. Peterson Podcast",
      ),
      Podcast(
        "American-English.jpg",
        "American English Podcast",
      ),
      Podcast(
        "Comedy-is-joke.jpg",
        "COMEDY IS JOKE",
      ),
      Podcast(
        "Bad-Friends.jpg",
        "Bad Friends Podcast",
      ),
      Podcast(
        "HotBoxIn.jpg",
        "Hotboxin",
      ),
    ];
  }

class ChoosePodcastScreen extends StatelessWidget {
  const ChoosePodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darGreyColor,
      body: SafeArea(
        child:                Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CustomScrollView(
                    slivers: [
                      OnboardingHeader(title: "Now choose some podcasts"),
                      const _SearchBox(),
                      _PodcastList(getList: getPodcastList()),
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
                  ChooseDoneButton(isArtist: false,),
                ],
              )
      ),
    );
  }
}



class _PodcastList extends StatelessWidget {
  const _PodcastList({required this.getList});
  final List<Podcast> getList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 90),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return PodcastAvatarWidget(
              podcast: getList[index],
            );
          },
          childCount: getList.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 165,
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
