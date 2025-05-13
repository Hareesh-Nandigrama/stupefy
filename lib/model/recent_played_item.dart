class RecentPlayedItem {
  final String image;
  final String title;
  final String author;
  final bool isArtist;
  RecentPlayedItem({
    required this.image,
    required this.title,
    required this.author,
    required this.isArtist,
  });

  // Factory constructor to create a RecentPlayedItem from JSON
  factory RecentPlayedItem.fromJson(Map<String, dynamic> json) {
    return RecentPlayedItem(
      image: json['image'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      isArtist: json['isArtist'] as bool,
    );
  }

  // Convert RecentPlayedItem to JSON
  Map<String, dynamic> toJson() {
    return {'image': image, 'title': title, 'author': author, 'isArtist': isArtist};
  }
}
