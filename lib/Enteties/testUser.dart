class TestUser {
  String? name;
  String? lastName;

  TestUser({this.name, this.lastName});

  factory TestUser.fromJson(Map<String, dynamic> json) {
    return TestUser(name: json['name'], lastName: json['lastname']);
  }
}
