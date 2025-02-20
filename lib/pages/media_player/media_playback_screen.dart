import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/constants.dart';
import '../../functions/timestamp_split/format_duration.dart';
import '../../store/player/song_state.dart';
import '../../widgets/media_player/video_player.dart';
import '../playlist/song_details_screen.dart';
import 'lyrics_section.dart';

class MediaPlayback extends StatefulWidget {
  const MediaPlayback({super.key});

  @override
  State<MediaPlayback> createState() => _MediaPlaybackState();
}

class _MediaPlaybackState extends State<MediaPlayback> {
  // final SongState songState = SongState();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder:
          (_) => Scaffold(
            backgroundColor: MyColors.blackColor,
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff61d6d6), Colors.blue],
                ),
              ),
              child: Stack(
                children: [
                  const BackVideoPlayer(key: Key("2")),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // Top header
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 38,
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/icon_arrow_left.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text.rich(
                                TextSpan(
                                  text: 'PLAYING FROM PLAYLIST \n',
                                  style: TextStyle(
                                    fontFamily: "AM",
                                    fontSize: 12,
                                    color: MyColors.whiteColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Your Mix Playlist 1',
                                      style: TextStyle(
                                        fontFamily: "AB",
                                        fontSize: 12,
                                        color: MyColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => SongDetailsScreen(
                                            trackName: "Something in the Sky",
                                            color: Colors.blue,
                                            singer: "Sam",
                                            albumImage: "shazam_playlist.png",
                                          ),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  "assets/images/icon_more.png",
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.56,
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Row(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'Something in the Sky \n',
                                      style: TextStyle(
                                        fontFamily: "AB",
                                        fontSize: 16,
                                        color: MyColors.whiteColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Sam Altman',
                                          style: TextStyle(
                                            fontFamily: "AM",
                                            fontSize: 14,
                                            color: MyColors.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: songState.toggleLike,
                                    child:
                                        songState.isLiked
                                            ? Image.asset(
                                              'assets/images/icon_heart_filled.png',
                                              height: 22,
                                              width: 22,
                                            )
                                            : Image.asset(
                                              'assets/images/icon_heart.png',
                                              color: Colors.white,
                                            ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SliderTheme(
                                  data: SliderThemeData(
                                    trackHeight: 2,
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 6,
                                    ),
                                    overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 12,
                                    ),
                                    activeTrackColor: MyColors.whiteColor,
                                    inactiveTrackColor: MyColors.whiteColor
                                        .withOpacity(0.3),
                                    thumbColor: MyColors.whiteColor,
                                  ),
                                  child: Slider(
                                    value:
                                        songState.position.inMilliseconds
                                            .toDouble(),
                                    onChanged: (value) {
                                      songState.seek(
                                        Duration(milliseconds: value.toInt()),
                                      );
                                    },
                                    min: 0.0,
                                    max:
                                        songState.duration.inMilliseconds
                                            .toDouble(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        formatDuration(songState.position),
                                        style: TextStyle(
                                          color: MyColors.whiteColor,
                                          fontSize: 12,
                                          fontFamily: "AM",
                                        ),
                                      ),
                                      Text(
                                        formatDuration(songState.duration),
                                        style: TextStyle(
                                          color: MyColors.whiteColor,
                                          fontSize: 12,
                                          fontFamily: "AM",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      icon: Icon(
                                        songState.isPlaying
                                            ? Icons.shuffle
                                            : Icons.shuffle_rounded,
                                        color:
                                            songState.isPlaying
                                                ? Colors.white
                                                : Colors.green,
                                      ),
                                      onPressed: null,
                                    ),
                                    Spacer(),
                                    IconButton(
                                      iconSize: 50,
                                      icon: Icon(
                                        songState.isPlaying
                                            ? Icons.navigate_before
                                            : Icons.navigate_before_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: null,
                                    ),
                                    Spacer(),
                                    IconButton(
                                      iconSize: 50,
                                      icon: Icon(
                                        songState.isPlaying
                                            ? Icons.pause_circle_filled
                                            : Icons.play_circle_fill,
                                        color: Colors.white,
                                      ),
                                      onPressed: songState.handlePlayPause,
                                    ),
                                    Spacer(),
                                    IconButton(
                                      iconSize: 50,
                                      icon: Icon(
                                        songState.isPlaying
                                            ? Icons.navigate_next
                                            : Icons.navigate_next_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: null,
                                    ),
                                    Spacer(),
                                    IconButton(
                                      iconSize: 30,
                                      icon: Icon(
                                        songState.isPlaying
                                            ? Icons.loop
                                            : Icons.loop_rounded,
                                        color:
                                            songState.isPlaying
                                                ? Colors.white
                                                : Colors.green,
                                      ),
                                      onPressed: null,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const LyricsSection(key: Key("1")),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0,
                                bottom: 0,
                                left: 15,
                                right: 15,
                              ),
                              child: SafeArea(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff175767),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Opacity(
                                          opacity: 0.7,
                                          child: CircleAvatar(
                                            radius: 120,
                                            backgroundImage: AssetImage(
                                              'assets/images/artists/Adele.jpg',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 5,
                                          child: Text(
                                            "About the Artist",
                                            style: TextStyle(
                                              fontFamily: "AB",
                                              fontSize: 18,
                                              color: MyColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 250,
                                          left: 5,
                                          right: 5,
                                          child: SizedBox(
                                            width: 320,
                                            child: Text(
                                              "Adele is a great artist with 10M followers, But did you know that Hareesh has a gf?",
                                              softWrap: true,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: "AM",
                                                fontSize: 19,
                                                color: MyColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
