import 'package:flutter/material.dart';
import 'package:techangles/models/article.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key, required this.article});
  final Article article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late final TextEditingController _editingController;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget.article.content);
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
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (scrollController.offset > 10) {
                      scrollController.animateTo(0,
                          duration: const Duration(
                              milliseconds: 500), //duration of scroll
                          curve: Curves.fastOutSlowIn);
                    }
                  },
                ),
                // Text(
                //   widget.article.content,
                //   style: const TextStyle(
                //       fontWeight: FontWeight.w400,
                //       fontSize: 18,
                //       color: Color(0xff1D2939)),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
