import 'dart:math';

import 'package:flutter/material.dart';
import 'package:github_news_demo/components/grid_category.dart';
import 'package:github_news_demo/components/searchbar.dart';
import 'package:github_news_demo/net/github_services.dart';
import 'package:github_news_demo/pages/public_feed_page.dart';

import '../components/card_event.dart';
import '../models/event.dart';

class HomeFeedPage extends StatefulWidget {
  const HomeFeedPage({Key? key}) : super(key: key);

  @override
  State<HomeFeedPage> createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {
  List<Event> events = [];
  bool loading = false;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() {
    debugPrint('拉取第$currentPage页');
    GithubServices.activityService
        .listPersonalEvents('Astra1427', currentPage, 2)
        .then((value) => setState(() {
              debugPrint('第$currentPage页数据获取完成');
              events.addAll(value);
              currentPage++;
              loading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: _onNotification,
          child: SizedBox(
            height: double.infinity,
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: SearchBarDelegate(),
                  pinned: true,
                ),
                SliverGrid(
                  delegate: SliverChildListDelegate(
                    createGrid(),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final itemIndex = index ~/ 2;
                    if (index.isEven) {
                      return CardEvent(model: events[itemIndex]);
                    }
                    return const Divider();
                  }, childCount: max(0, events.length * 2 - 1)),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _onNotification(ScrollNotification notification) {
    return _onScrollEvent(notification);
  }

  bool _onScrollEvent(ScrollNotification scrollNotification) {
    /*print('extentAfter:${scrollNotification.metrics.extentAfter.toInt()}    '
        'pixels:${scrollNotification.metrics.pixels.toInt()}    '
        'maxScrollExtent:${scrollNotification.metrics.maxScrollExtent.toInt()}    ');*/
    if (scrollNotification.metrics.extentAfter == 0.0 &&
        scrollNotification.metrics.pixels >=
            scrollNotification.metrics.maxScrollExtent * 0.8) {
      if (loading) return false;
      setState(() {
        loading = true;
        print('loading.........');
      });
      loadNextPage();
    }
    return false;
  }

  List<Widget> createGrid() {
    List<GridItem> items = [
      GridItem(
          title: 'GitHub Trends',
          icon: Icons.trending_up,
          getPage: (context) => const HomeFeedPage(),
          color: Colors.orange),
      GridItem(
          title: 'Public Events',
          icon: Icons.timeline_outlined,
          getPage: (context) => const PublicFeedPage(),
          color: Colors.green),
      GridItem(
          title: 'Users',
          icon: Icons.people,
          getPage: (context) => const HomeFeedPage(),
          color: Colors.pink),
      GridItem(
          title: 'Projects',
          icon: Icons.work,
          getPage: (context) => const HomeFeedPage(),
          color: Colors.blue),
    ];
    return items.map((e) => GridCategory(item: e)).toList();
  }
}
