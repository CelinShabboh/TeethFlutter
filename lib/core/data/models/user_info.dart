class UserInfo {
  String? name;
  String? password;
  String? phone;
  String? governorate;
  int? id;

  UserInfo({this.name, this.password, this.phone, this.governorate, this.id});

  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    governorate = json['governorate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['governorate'] = this.governorate;
    data['id'] = this.id;
    return data;
  }
}