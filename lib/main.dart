import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:techangles/models/article.dart';
import 'package:techangles/screens/home.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());
  runApp(const TechAnglesApp());
}

class TechAnglesApp extends StatelessWidget {
  const TechAnglesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Tech Angles',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Graphik'),
        home: const HomePage(),
      ),
    );
  }
}
