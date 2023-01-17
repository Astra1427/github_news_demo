import 'package:github_news_demo/models/repository.dart';
import 'package:github_news_demo/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  String id;
  String type;
  Repository repo;
  User actor;
  Map<String , dynamic> payload;

  Event(this.id, this.type, this.repo, this.actor, this.payload);


  factory Event.fromJson(Map<String,dynamic> json) => _$EventFromJson(json);
  Map<String,dynamic> toJson()=> _$EventToJson(this);
}