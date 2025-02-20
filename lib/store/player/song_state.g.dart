// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SongState on _SongState, Store {
  late final _$isPlayingAtom =
      Atom(name: '_SongState.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$positionAtom =
      Atom(name: '_SongState.position', context: context);

  @override
  Duration get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Duration value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_SongState.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$isLikedAtom = Atom(name: '_SongState.isLiked', context: context);

  @override
  bool get isLiked {
    _$isLikedAtom.reportRead();
    return super.isLiked;
  }

  @override
  set isLiked(bool value) {
    _$isLikedAtom.reportWrite(value, super.isLiked, () {
      super.isLiked = value;
    });
  }

  late final _$isInitializedAtom =
      Atom(name: '_SongState.isInitialized', context: context);

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  late final _$errorAtom = Atom(name: '_SongState.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$handlePlayPauseAsyncAction =
      AsyncAction('_SongState.handlePlayPause', context: context);

  @override
  Future<void> handlePlayPause() {
    return _$handlePlayPauseAsyncAction.run(() => super.handlePlayPause());
  }

  late final _$seekAsyncAction =
      AsyncAction('_SongState.seek', context: context);

  @override
  Future<void> seek(Duration position) {
    return _$seekAsyncAction.run(() => super.seek(position));
  }

  late final _$_SongStateActionController =
      ActionController(name: '_SongState', context: context);

  @override
  void toggleLike() {
    final _$actionInfo =
        _$_SongStateActionController.startAction(name: '_SongState.toggleLike');
    try {
      return super.toggleLike();
    } finally {
      _$_SongStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
position: ${position},
duration: ${duration},
isLiked: ${isLiked},
isInitialized: ${isInitialized},
error: ${error}
    ''';
  }
}
