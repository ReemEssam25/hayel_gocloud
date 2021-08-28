class AccountModel {
  String username;
  String password;
  String phoneNumber;
  String fullname;

  AccountModel({
    this.username,
    this.password,
    this.phoneNumber,
    this.fullname,
  });

  AccountModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['fullname'] = this.fullname;

    return data;
  }
}
