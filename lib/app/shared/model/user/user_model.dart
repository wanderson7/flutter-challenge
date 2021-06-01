import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: true)
class UserModel {
  String? name;
  String? id;
  String? email;
  String? cpf;
  String? phoneNumber;
  bool? emailUpdatesAllowed;
  String? password;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
