import 'package:flutter/material.dart';
import 'package:techangles/data/news_articles.dart';
import 'package:techangles/widgets/news_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: newsArticlesMock.length,
          itemBuilder: (context, index) => NewsTile(
            article: newsArticlesMock[index],
          ),
        ),
      ),
    );
  }
}
