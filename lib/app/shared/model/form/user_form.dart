class UserForm {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  bool? emailUpdatesAllowed;
  String? cpf;

  UserForm({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.emailUpdatesAllowed,
    this.cpf,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['emailUpdatesAllowed'] = this.emailUpdatesAllowed;
    data['cpf'] = this.cpf;
    return data;
  }
}
