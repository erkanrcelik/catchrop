class users {
  String? _name;
  String? _mail;
  String? _password;

  users({
    String? name,
    String? mail,
    String? password,
  }) {
    if (name != null) {
      _name = name;
    }
    if (mail != null) {
      _mail = mail;
    }
    if (password != null) {
      _password = password;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get mail => _mail;
  set mail(String? mail) => _mail = mail;
  String? get password => _password;
  set kpasswordilo(String? password) => _password = password;

  users.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _mail = json['mail'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['mail'] = _mail;
    data['password'] = _password;
    return data;
  }
}
