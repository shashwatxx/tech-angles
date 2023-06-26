import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techangles/screens/article_page.dart';
import 'package:techangles/services/local_db.dart';
import 'package:techangles/widgets/news_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.read(localDbRepositoryProvider).clear();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: StreamBuilder(
            stream: ref.watch(localDbRepositoryProvider).getAllArticles(),
            builder: (context, snapshot) {
              // Shows progress indicator while data is loadinbg from DB
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              //Checks if future has any data & it's just not a empty list
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => NewsTile(
                    article: snapshot.data![index],
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute<bool>(
                            builder: (context) =>
                                ArticlePage(article: snapshot.data![index]),
                          ));
                    },
                  ),
                );
              }
              return Column(
                children: [
                  const Center(child: Text("No Data Found!")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Retry!"))
                ],
              );
            }),
      ),
    );
  }
}
