import 'package:github_news_demo/net/activity_service.dart';
import 'package:github_news_demo/net/github.dart';

class GithubServices{
  static late Github _github;

  static late ActivityService activityService;

  static void init(Github github){
    _github = github;
    activityService = ActivityService(_github);
  }
}