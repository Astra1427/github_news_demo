import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  String login;
  int id;
  String avatarUrl;
  String htmlUrl;
  String name;
  String company;
  String blog;
  String location;
  String email;

  @JsonKey(name:'followers')
  int followersCount;

  @JsonKey(name:'following')
  int followingCount;

  User(
      this.login,
      this.id,
      this.avatarUrl,
      this.htmlUrl,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.followersCount,
      this.followingCount);

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String,dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson2(String jsonStr) => _$UserFromJson(json.decode(jsonStr));
  String toJson2()=> json.encode(_$UserToJson(this));

}