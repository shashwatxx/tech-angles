import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techangles/models/article.dart';
import 'package:techangles/services/local_db.dart';

class ArticlePage extends ConsumerStatefulWidget {
  const ArticlePage({super.key, required this.article});
  final Article article;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArticlePageState();
}

class _ArticlePageState extends ConsumerState<ArticlePage> {
  late final TextEditingController _editingController;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget.article.content);
  }

  void scrollToTop() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (scrollController.offset > 10) {
      scrollController.animateTo(0,
          duration: const Duration(
            milliseconds: 500,
          ),
          curve: Curves.fastOutSlowIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Text(
                  widget.article.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: Colors.black),
                ),
                TextField(
                  decoration: const InputDecoration(),
                  controller: _editingController,
                  maxLines: 300,
                  onTapOutside: (event) => scrollToTop(),
                  keyboardType: TextInputType.text,
                  onSubmitted: (value) {
                    scrollToTop();
                    ref.read(localDbRepositoryProvider).updateArticle(
                        widget.article.key,
                        widget.article.copyWith(content: value));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
