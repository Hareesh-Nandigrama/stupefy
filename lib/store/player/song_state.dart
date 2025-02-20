import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';

part 'song_state.g.dart';

class SongState = _SongState with _$SongState;

// Singleton instance
final SongState songState = SongState._internal();

abstract class _SongState with Store {
  _SongState._internal() {
    _init(); // Add this line to initialize the player
  }

  final AudioPlayer audioPlayer = AudioPlayer();

  @observable
  bool isPlaying = false;

  @observable
  Duration position = Duration.zero;

  @observable
  Duration duration = Duration.zero;

  @observable
  bool isLiked = false;

  @observable
  bool isInitialized = false;

  @observable
  String? error;

  late StreamSubscription _playerStateSubscription;
  late StreamSubscription _positionSubscription;
  late StreamSubscription _durationSubscription;
  late StreamSubscription _processingStateSubscription;

  Future<void> _init() async {
    try {
      await audioPlayer.setAudioSource(
        AudioSource.asset('assets/audio/Where I come from - Passion Pit.mp3'),
        initialPosition: Duration.zero,
        preload: true,
      );

      await audioPlayer.setVolume(1.0);
      await audioPlayer.setAndroidAudioAttributes(
        const AndroidAudioAttributes(
          contentType: AndroidAudioContentType.music,
          usage: AndroidAudioUsage.media,
          flags: AndroidAudioFlags.none,
        ),
      );

      _playerStateSubscription = audioPlayer.playerStateStream.listen((state) {
        runInAction(() {
          isPlaying = state.playing;
        });
      });

      _positionSubscription = audioPlayer.positionStream.listen((pos) {
        runInAction(() {
          position = pos;
        });
      });

      _durationSubscription = audioPlayer.durationStream.listen((dur) {
        runInAction(() {
          duration = dur ?? Duration.zero;
        });
      });

      _processingStateSubscription = audioPlayer.processingStateStream.listen((
        state,
      ) {
        if (state == ProcessingState.completed) {
          runInAction(() {
            isPlaying = false;
          });
          audioPlayer.seek(Duration.zero);
        }
      });

      runInAction(() {
        isInitialized = true;
      });
    } catch (e) {
      runInAction(() {
        error = 'Error initializing audio: $e';
      });
      print(error);
    }
  }

  @action
  void toggleLike() {
    isLiked = !isLiked;
  }

  @action
  Future<void> handlePlayPause() async {
    if (!isInitialized) return;

    try {
      if (isPlaying) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play();
      }
    } catch (e) {
      runInAction(() {
        error = 'Error handling play/pause: $e';
      });
      print(error);
    }
  }

  @action
  Future<void> seek(Duration position) async {
    await audioPlayer.seek(position);
  }

  void dispose() {
    _playerStateSubscription.cancel();
    _positionSubscription.cancel();
    _durationSubscription.cancel();
    _processingStateSubscription.cancel();
    audioPlayer.dispose();
  }
}
