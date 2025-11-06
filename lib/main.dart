import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_simple/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_simple/injection_container.dart';

import 'features/daily_news/presentation/pages/home/daily_news.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DailyNews(),
      ),
    );
  }
}
