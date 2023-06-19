class Article {
  final String title;
  final String content;
  final String imageUrl;

  Article({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  Article copyWith({
    String? title,
    String? content,
    String? imageUrl,
  }) =>
      Article(
        title: title ?? this.title,
        content: content ?? this.content,
        imageUrl: imageUrl ?? this.imageUrl,
      );
}
