import 'dart:math';

import 'package:flutter/material.dart';
import 'package:github_news_demo/components/card_event2.dart';
import 'package:github_news_demo/net/github_services.dart';

import '../models/event.dart';

class PublicFeedPage extends StatefulWidget {
  const PublicFeedPage({Key? key}) : super(key: key);

  @override
  State<PublicFeedPage> createState() => _PublicFeedPageState();
}

class _PublicFeedPageState extends State<PublicFeedPage> {
  List<Event> events = [];
  bool isLoading = false;
  int currentPageIndex = 1;
  int perPage = 2;

  void loadNextPage() {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    GithubServices.activityService
        .listPublicEvents(currentPageIndex++, perPage)
        .then((value) {
      if (value.isEmpty) return;
      setState(() {
        events.addAll(value);
        isLoading = false;

      });

    });
  }
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public Events'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _onNotification,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: max(0, events.length * 2 - 1),
                (context, index) {
                  if (index.isEven) {
                    return const Divider();
                  }
                  return CardEvent2(event: events[index ~/ 2]);
                },
              )),
              if(isLoading)
                const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification.metrics.extentAfter == 0 &&
        notification.metrics.pixels >=
            notification.metrics.maxScrollExtent * 0.8) {
      if (isLoading) return false;

      loadNextPage();
    }
    return false;
  }
}
