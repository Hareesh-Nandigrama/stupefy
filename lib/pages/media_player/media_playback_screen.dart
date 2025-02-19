import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../constants/constants.dart';
import '../../functions/timestamp_split/format_duration.dart';
import '../../widgets/media_player/video_player.dart';
import '../playlist/song_details_screen.dart';
import 'lyrics_section.dart';

class MediaPlayback extends StatefulWidget {
  const MediaPlayback({super.key});

  @override
  State<MediaPlayback> createState() => _MediaPlaybackState();
}

class _MediaPlaybackState extends State<MediaPlayback> {
  bool _isLiked = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize audio
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      // Remove AudioSession configuration
      await _audioPlayer.setAudioSource(
        AudioSource.asset('assets/audio/Where I come from - Passion Pit.mp3'),
        initialPosition: Duration.zero,
        preload: true,
      );

      // Set audio mixing behavior
      await _audioPlayer.setVolume(1.0);
      await _audioPlayer.setAndroidAudioAttributes(
        const AndroidAudioAttributes(
          contentType: AndroidAudioContentType.music,
          usage: AndroidAudioUsage.media,
          flags: AndroidAudioFlags.none,
        ),
      );

      // Listen for player state changes
      _audioPlayer.playerStateStream.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state.playing;
          });
        }
      });

      // Add this: Listen for playback completion
      _audioPlayer.processingStateStream.listen((state) {
        if (state == ProcessingState.completed) {
          setState(() {
            _isPlaying = false;
          });
          _audioPlayer.seek(Duration.zero); // Reset to beginning
        }
      });
    } catch (e) {
      print('Error initializing audio: $e');
    }
  }

  void _handlePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play();
      }
    } catch (e) {
      print('Error handling play/pause: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Image.asset(
                          "assets/images/icon_arrow_left.png",
                          height: 16,
                          width: 16,
                        ),
                        Spacer(),
                        Text.rich(
                          TextSpan(
                            text: 'PLAYING FROM PLAYLIST \n', // First line
                            style: TextStyle(
                              fontFamily: "AM",
                              fontSize: 12,
                              color: MyColors.whiteColor,
                            ), // Normal styling
                            children: [
                              TextSpan(
                                text: 'Your Mix Playlist 1', // Second line
                                style: TextStyle(
                                  fontFamily: "AB",
                                  fontSize: 12,
                                  color: MyColors.whiteColor,
                                ), // Bold styling
                              ),
                            ],
                          ),
                          textAlign:
                              TextAlign.center, // Center alignment if needed
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
                          child: Image.asset("assets/images/icon_more.png"),
                        ),
                      ],
                    ),
                  ),

                  // Main content with spacing
                  SizedBox(height: MediaQuery.of(context).size.height * 0.56),

                  // Player controls and lyrics
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                            'assets/images/2010/Sunflower - Spider-Man_ Into-the-Spider-Verse.jpg',
                            height: 90,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Something in the Sky \n',
                                // First line
                                style: TextStyle(
                                  fontFamily: "AB",
                                  fontSize: 16,
                                  color: MyColors.whiteColor,
                                ),
                                // Normal styling
                                children: [
                                  TextSpan(
                                    text: 'Sam Altman', // Second line
                                    style: TextStyle(
                                      fontFamily: "AM",
                                      fontSize: 14,
                                      color: MyColors.whiteColor,
                                    ), // Bold styling
                                  ),
                                ],
                              ),
                              textAlign:
                                  TextAlign.left, // Center alignment if needed
                            ),
                            Spacer(),
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
                      StreamBuilder<Duration>(
                        stream: _audioPlayer.positionStream,
                        builder: (context, snapshot) {
                          final position = snapshot.data ?? Duration.zero;
                          final duration =
                              _audioPlayer.duration ?? Duration.zero;
                          return Column(
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
                                  value: position.inMilliseconds.toDouble(),
                                  onChanged: (value) {
                                    _audioPlayer.seek(
                                      Duration(milliseconds: value.toInt()),
                                    );
                                  },
                                  min: 0.0,
                                  max: duration.inMilliseconds.toDouble(),
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
                                      formatDuration(position),
                                      style: TextStyle(
                                        color: MyColors.whiteColor,
                                        fontSize: 12,
                                        fontFamily: "AM",
                                      ),
                                    ),
                                    Text(
                                      formatDuration(duration),
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
                                      _isPlaying
                                          ? Icons.shuffle
                                          : Icons.shuffle_rounded,
                                      color:
                                          _isPlaying
                                              ? Colors.white
                                              : Colors.green,
                                    ),
                                    onPressed: null,
                                  ),
                                  Spacer(),
                                  IconButton(
                                    iconSize: 50,
                                    icon: Icon(
                                      _isPlaying
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
                                      _isPlaying
                                          ? Icons.pause_circle_filled
                                          : Icons.play_circle_fill,
                                      color: Colors.white,
                                    ),
                                    onPressed: _handlePlayPause,
                                  ),
                                  Spacer(),
                                  IconButton(
                                    iconSize: 50,
                                    icon: Icon(
                                      _isPlaying
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
                                      _isPlaying
                                          ? Icons.loop
                                          : Icons.loop_rounded,
                                      color:
                                          _isPlaying
                                              ? Colors.white
                                              : Colors.green,
                                    ),
                                    onPressed: null,
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
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
                            height: MediaQuery.of(context).size.height * 0.45,
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
    );
  }
}
