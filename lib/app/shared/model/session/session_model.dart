import 'package:flutter_challenge/app/shared/model/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class SessionModel{
  String? token;
  UserModel? user;

  SessionModel();

  factory SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);
}