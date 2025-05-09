class PlaylistSong {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;
  final String audioUrl;

  PlaylistSong({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.audioUrl,
  });

  factory PlaylistSong.fromJson(Map<String, dynamic> json) {
    return PlaylistSong(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      imageUrl: json['image_url'],
      audioUrl: json['audio_url'],
    );
  }
}
