import 'package:flutter/material.dart';
import 'package:stupefy/data/playlist_data.dart';
import 'package:stupefy/widgets/nav_bar/nav_bar_wrapper.dart';
import 'package:stupefy/widgets/playlist/playlist_song_tile.dart';

import '../../constants/colors.dart';
import '../../model/playlist.dart';
import '../../widgets/media_player/stream_buttons.dart';
import 'song_search_page.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist = trackList("Drake mix");
  final String cover = "Drake-Mix.jpg";

  PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool _isInPlay = false;
  bool _isDownloaded = false;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return NavBarWrapper(
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/home/${widget.cover}',
                        height: 270,
                        width: 270,
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      // Wrap the Column in a Flexible widget
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "New and approved indie pop. CoverL No Rome",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 13,
                              color: MyColors.lightGrey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Image.asset('assets/images/icon_spotify.png'),
                              const SizedBox(width: 5),
                              const Text(
                                "Spotify",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "1,629,592 likes . ${widget.playlist.time}",
                            style: const TextStyle(
                              fontSize: 13,
                              color: MyColors.lightGrey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isLiked = !_isLiked;
                                    });
                                  },
                                  child:
                                      (_isLiked)
                                          ? Image.asset(
                                            'assets/images/icon_heart_filled.png',
                                            height: 19,
                                            width: 20,
                                          )
                                          : Image.asset(
                                            'assets/images/icon_heart.png',
                                          ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isDownloaded = !_isDownloaded;
                                    });
                                  },
                                  child:
                                      (_isDownloaded)
                                          ? Image.asset(
                                            'assets/images/icon_downloaded.png',
                                          )
                                          : Image.asset(
                                            'assets/images/icon_download.png',
                                          ),
                                ),
                                Image.asset('assets/images/icon_more.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isInPlay = !_isInPlay;
                          });
                        },
                        child:
                            (_isInPlay)
                                ? const PlayButton(
                                  color: MyColors.greenColor,
                                  height: 56,
                                  width: 56,
                                )
                                : const PauseButton(
                                  iconWidth: 5,
                                  iconHeight: 19,
                                  color: MyColors.greenColor,
                                  height: 56,
                                  width: 56,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 20, bottom: 35),
                sliver:
                    widget.playlist.tracks.isEmpty
                        ? SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Text(
                                "Let's start building your playlist",
                                style: TextStyle(
                                  color: MyColors.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const SongSearchPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 30,
                                  ),
                                ),
                                child: const Text(
                                  'Add to this playlist',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "AB",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        : SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return PlaylistSongTile(
                              song: widget.playlist.tracks[index],
                            );
                          }, childCount: widget.playlist.tracks.length),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
