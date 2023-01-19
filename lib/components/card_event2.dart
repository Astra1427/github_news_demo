import 'package:flutter/material.dart';
import 'package:github_news_demo/models/event.dart';

class CardEvent2 extends StatelessWidget {
  final Event event;

  const CardEvent2({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: ()=>openProject(context),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(event.actor.avatarUrl), fit: BoxFit.fill),
              ),
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
                        Text(event.actor.login,style: TextStyle(fontSize: 16,color: Colors.grey[600]),),
                        SizedBox(width: 50,),
                        Text(event.type,style: TextStyle(fontSize: 16,color: Colors.grey[600]),),
                      ],
                    ),
                    Text(event.repo.name+' 1234567890123456789',style: TextStyle(color:Colors.blue[900]),),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void openProject(BuildContext context){}
}
