import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:techangles/data/news_articles.dart';
import 'package:techangles/models/article.dart';

final localDbRepositoryProvider = Provider((ref) => LocalDBRepository());

class LocalDBRepository {
  static const newsArticleboxKey = 'articles';

  Future<Box<Article>> get box async =>
      await Hive.openBox<Article>(newsArticleboxKey);

  Future<void> addAllArticles(List<Article> articles) async {
    if ((await box).isEmpty) {
      for (var article in articles) {
        await (await box).add(article);
      }
    }
  }

  Future<void> deleteAllArticles(List<Article> articles) async {
    for (var article in articles) {
      await article.delete();
    }
  }

  Future<bool> isEmpty() async {
    return (await box).isEmpty;
  }

  Future<void> deleteArticle(String articleId) async {
    await (await box).delete(articleId);
  }

  Stream<List<Article>> getAllArticles() async* {
    // This addAllArticles() is just called to mock the data and add it into local Db
    await addAllArticles(newsArticlesMock);
    // await clear();

    yield (await box).values.toList();
  }

  Future<ValueListenable<Box<Article>>> listenable() async {
    return (await box).listenable();
  }

  Future<void> updateArticle(int key, Article article) async {
    try {
      await (await box).put(key, article);
      log("Item Saved at key -$key as Article id-> ${article.id}");
    } catch (e) {
      throw Exception("Item not in Box");
    }
  }

  Future<void> clear() async {
    return await Hive.deleteBoxFromDisk(newsArticleboxKey);
  }
}
