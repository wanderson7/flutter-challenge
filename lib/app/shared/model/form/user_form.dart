import 'package:flutter_challenge/app/helpers/formatter_helper.dart';
class UserForm {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  bool emailUpdatesAllowed;
  String? cpf;

  UserForm({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.emailUpdatesAllowed = false,
    this.cpf,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber?.extractNumbers;
    data['password'] = this.password;
    data['emailUpdatesAllowed'] = this.emailUpdatesAllowed;
    data['cpf'] = this.cpf?.extractNumbers;
    return data;
  }
}
