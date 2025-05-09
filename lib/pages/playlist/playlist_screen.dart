import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/playlist_data.dart';
import '../../model/playlist.dart';
import '../../widgets/media_player/stream_buttons.dart';
import '../../widgets/nav_bar/nav_bar_wrapper.dart';
import '../../widgets/playlist/bottom_modal.dart';
import '../../widgets/playlist/playlist_song_tile.dart';
import 'song_search_page.dart';

class PlaylistScreen extends StatefulWidget {
  final String playlistName;
  final String playlistImage;

  const PlaylistScreen({
    super.key,
    this.playlistName = "Drake mix",
    this.playlistImage = "artists/Drake.jpg",
  });

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late final Playlist playlist;

  bool _isInPlay = false;
  bool _isDownloaded = false;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    playlist = trackList(widget.playlistName);
  }

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
                    Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/${widget.playlistImage}",
                            height: 270,
                            width: 270,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 35,
                          child: SizedBox(
                            width: 100,
                            child: Text(
                              widget.playlistName,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 20,
                                color: MyColors.lightGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                            "1,629,592 likes . ${playlist.time}",
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
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      backgroundColor: Colors.black,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (context) => const BottomModal(),
                                    );
                                  },
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                  ),
                                ),
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
                    playlist.tracks.isEmpty
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
                            if (index == 0) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const SongSearchPage(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Text(
                                    "Add to this playlist",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  leading: Container(
                                    width: 48,
                                    height: 48,
                                    color: Colors.grey[800],
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                              );
                            }

                            return PlaylistSongTile(
                              song: playlist.tracks[index - 1],
                            );
                          }, childCount: playlist.tracks.length + 1),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
