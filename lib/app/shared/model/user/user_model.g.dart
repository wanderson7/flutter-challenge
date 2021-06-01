// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel()
    ..name = json['name'] as String?
    ..id = json['id'] as String?
    ..email = json['email'] as String?
    ..cpf = json['cpf'] as String?
    ..phoneNumber = json['phoneNumber'] as String?
    ..emailUpdatesAllowed = json['emailUpdatesAllowed'] as bool?
    ..password = json['password'] as String?;
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
      'cpf': instance.cpf,
      'phoneNumber': instance.phoneNumber,
      'emailUpdatesAllowed': instance.emailUpdatesAllowed,
      'password': instance.password,
    };
