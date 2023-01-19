import 'dart:convert';

import 'package:github_news_demo/models/event.dart';
import 'package:github_news_demo/net/service.dart';

class ActivityService extends Service {
  ActivityService(super.github);

  Future<List<Event>> listPublicEvents(int page, int perPage) async {
    var response = await github
        .request('GET', '/events', params: {'page': page, 'per_page': perPage});
    final json = jsonDecode(response.body) as List;
    return json.map((e) => Event.fromJson(e)).toList();
  }

  Future<List<Event>> listPersonalEvents(
      String login, int page, int perPage) async {
    var response =
        await github.request('GET', '/users/$login/received_events', params: {
      'page': page,
      'per_page': perPage,
    });

    print(response.body);
    final json = jsonDecode(response.body) as List<dynamic>;
    return json.map((e) => Event.fromJson(e)).toList();
  }
}
