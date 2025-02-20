import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../constants/constants.dart';
import '../../pages/media_player/listening_on_screen.dart';
import '../../pages/media_player/media_playback_screen.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer({super.key});

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  bool _isLiked = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _audioPlayer.setAudioSource(
        AudioSource.asset('assets/audio/Where I come from - Passion Pit.mp3'),
        initialPosition: Duration.zero,
        preload: true,
      );

      await _audioPlayer.setVolume(1.0);
      await _audioPlayer.setAndroidAudioAttributes(
        const AndroidAudioAttributes(
          contentType: AndroidAudioContentType.music,
          usage: AndroidAudioUsage.media,
          flags: AndroidAudioFlags.none,
        ),
      );

      _audioPlayer.playerStateStream.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state.playing;
          });
        }
      });

      _audioPlayer.processingStateStream.listen((state) {
        if (state == ProcessingState.completed) {
          setState(() {
            _isPlaying = false;
          });
          _audioPlayer.seek(Duration.zero);
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
    return Container(
      alignment: Alignment.center,
      height: 59,
      width: MediaQuery.of(context).size.width - 10,
      decoration: const BoxDecoration(
        color: MyColors.darGreyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(
                              milliseconds: 250,
                            ),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const MediaPlayback(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              const begin = Offset(0.0, 1.0);
                              const end = Offset.zero;
                              final tween = Tween(begin: begin, end: end);
                              final offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        ),
                    child: Row(
                      children: [
                        Container(
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/home/AUSTIN.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 20,
                              child: const Text(
                                "Enough is Enough",
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "AM",
                                  color: MyColors.whiteColor,
                                  fontSize: 13.5,
                                ),
                              ),
                            ),
                            const Text(
                              "Post Malone",
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "AM",
                                fontSize: 12,
                                color: MyColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ListeningOn(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/icon_listen.png',
                          color: MyColors.lightGrey,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isLiked = !_isLiked;
                            });
                          },
                          child:
                              _isLiked
                                  ? Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icon_heart_filled.png',
                                        height: 22,
                                        width: 22,
                                      ),
                                      const SizedBox(width: 9),
                                    ],
                                  )
                                  : Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icon_heart.png',
                                      ),
                                      const SizedBox(width: 9),
                                    ],
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: _handlePlayPause,
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child:
                              !_isPlaying
                                  ? Image.asset(
                                    'assets/images/icon_play.png',
                                    color: MyColors.whiteColor,
                                  )
                                  : Row(
                                    children: [
                                      Container(
                                        height: 17,
                                        width: 5,
                                        color: MyColors.whiteColor,
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 17,
                                        width: 5,
                                        color: MyColors.whiteColor,
                                      ),
                                    ],
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder<Duration>(
              stream: _audioPlayer.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                final duration = _audioPlayer.duration ?? Duration.zero;
                return SliderTheme(
                  data: SliderThemeData(
                    overlayShape: SliderComponentShape.noOverlay,
                    thumbShape: SliderComponentShape.noThumb,
                    trackShape: const RectangularSliderTrackShape(),
                    trackHeight: 3,
                  ),
                  child: SizedBox(
                    height: 8,
                    child: Slider(
                      activeColor: MyColors.whiteColor,
                      inactiveColor: MyColors.lightGrey,
                      value: position.inMilliseconds.toDouble(),
                      max: duration.inMilliseconds.toDouble(),
                      onChanged: (value) {
                        _audioPlayer.seek(
                          Duration(milliseconds: value.toInt()),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
