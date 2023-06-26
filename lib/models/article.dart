import 'package:hive_flutter/hive_flutter.dart';

part 'article.g.dart';

@HiveType(typeId: 0) 
class Article extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String imageUrl;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "imageUrl": imageUrl,
      };

  Article copyWith({
    String? id,
    String? title,
    String? content,
    String? imageUrl,
  }) =>
      Article(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        imageUrl: imageUrl ?? this.imageUrl,
      );
}
