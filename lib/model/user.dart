class User {
  int? userId;
  String? userName;
  String? emailId;
  String? password;

  User({this.userId, this.userName, this.emailId, this.password});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    emailId = json['emailId'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['emailId'] = this.emailId;
    data['password'] = this.password;
    return data;
  }
}