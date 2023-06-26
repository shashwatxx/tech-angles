import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:techangles/models/article.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.article, required this.onPressed});

  final Article article;
  final VoidCallback onPressed;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 28 / 22,
                          color: Color(0xff1D2939),
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.article.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 24 / 16,
                          color: Color(0xff475467),
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                  imageUrl: widget.article.imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
