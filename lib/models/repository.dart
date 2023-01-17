import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Repository{
  final String name;
  final int id;
  final String fullName;
  final UserInformation owner;
  final bool private;
  final bool fork;
  final String url;
  final String description;
  final String cloneUrl;
  final String gitUrl;
  final String homePage;
  final int size;

  @JsonKey(name:'stargazers_count')
  final int stargazersCount;

  @JsonKey(name:'watchers_count')
  final int watchersCount;

  @JsonKey(name:'forks_count')
  final int forksCount;

  @JsonKey(name:'subscribers_count')
  final int subscribersCount;

  Repository(
      this.name,
      this.id,
      this.fullName,
      this.owner,
      this.private,
      this.fork,
      this.url,
      this.description,
      this.cloneUrl,
      this.gitUrl,
      this.homePage,
      this.size,
      this.stargazersCount,
      this.watchersCount,
      this.forksCount,
      this.subscribersCount);

  factory Repository.fromJson(Map<String,dynamic> json) => _$RepositoryFromJson(json);
  Map<String,dynamic> toJson() => _$RepositoryToJson(this);

  factory Repository.fromJson2(String jsonStr) => _$RepositoryFromJson(json.decode(jsonStr));
  String toJson2() => json.encode( _$RepositoryToJson(this));
}

@JsonSerializable(fieldRename:FieldRename.snake)
class UserInformation{
  final String login;
  final int id;
  final String avatarUrl;
  final String htmlUrl;

  UserInformation(this.login, this.id, this.avatarUrl, this.htmlUrl);

  factory UserInformation.fromJson(Map<String,dynamic> map) => _$UserInformationFromJson(map);
  Map<String,dynamic> toJson() => _$UserInformationToJson(this);

  factory UserInformation.fromJson2(String jsonStr) => _$UserInformationFromJson(json.decode(jsonStr));
  String toJson2() => json.encode(_$UserInformationToJson(this));
}