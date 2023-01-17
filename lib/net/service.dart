import 'package:github_news_demo/net/github.dart';

abstract class Service{
  final Github github;

  const Service(this.github);
}