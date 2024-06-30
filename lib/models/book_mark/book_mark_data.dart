class BookMarkData {
  final String title;
  final String contentUrl;
  final String thumbnailUrl;
  final DateTime date;

  BookMarkData({
    required this.title,
    required this.contentUrl,
    required this.thumbnailUrl,
    required this.date,
  });

  factory BookMarkData.fromJson(Map<String, dynamic> json) {
    return BookMarkData(
      title: json['title'],
      contentUrl: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'contentUrl': contentUrl,
        'thumbnailUrl': thumbnailUrl,
        'date': date,
      };
}
