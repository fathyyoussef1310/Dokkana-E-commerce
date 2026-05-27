import 'Avatar.dart';

class User {
  User({
      this.id, 
      this.avatar, 
      this.username, 
      this.email, 
      this.role, 
      this.loginType, 
      this.isEmailVerified, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    username = json['username'];
    email = json['email'];
    role = json['role'];
    loginType = json['loginType'];
    isEmailVerified = json['isEmailVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  Avatar? avatar;
  String? username;
  String? email;
  String? role;
  String? loginType;
  bool? isEmailVerified;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (avatar != null) {
      map['avatar'] = avatar?.toJson();
    }
    map['username'] = username;
    map['email'] = email;
    map['role'] = role;
    map['loginType'] = loginType;
    map['isEmailVerified'] = isEmailVerified;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}