class RecentPlayedItem {
  final String image;
  final String title;

  RecentPlayedItem({
    required this.image,
    required this.title,
  });

  // Factory constructor to create a RecentPlayedItem from JSON
  factory RecentPlayedItem.fromJson(Map<String, dynamic> json) {
    return RecentPlayedItem(
      image: json['image'] as String,
      title: json['title'] as String,
    );
  }

  // Convert RecentPlayedItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
    };
  }
} 