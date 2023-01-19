import 'package:flutter/material.dart';
import 'package:github_news_demo/models/event.dart';

class CardEvent extends StatelessWidget {
  final Event model;

  const CardEvent({Key? key, required this.model}) : super(key: key);

  void openProject(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openProject(context),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(model.actor.avatarUrl))),
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      model.actor.login,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      model.type,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  model.repo.name,
                  style: TextStyle(fontSize: 16, color: Colors.blue[900]),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
