import 'package:flutter/material.dart';
import 'package:github_news_demo/net/github.dart';
import 'package:github_news_demo/net/github_services.dart';
import 'package:github_news_demo/pages/home_feed.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    String userName = 'Astra1427';
    String token = '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';
    GithubServices.init(Github(token));
    return MaterialApp(
      title: 'Github 技术头条',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const HomeFeedPage(),
    );
  }

}
