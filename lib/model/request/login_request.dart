class LoginRequestModel{
  String? account;
  String? password;
  String? role;

  LoginRequestModel({this.account, this.password, this.role});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['account'] = account;
    data['password'] = password;
    data['role'] = role;
    return data;
  }

  @override
  String toString() {
    return 'LoginRequestModel{account: $account, password: $password, role: $role}';
  }
}