import 'package:perlatech/Auth/user/domain/entities/user_info_entitnes.dart';

class UserInfoModel extends UserInfo {
  const UserInfoModel({required super.token, required super.userLogin});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        userLogin: userLoginModel.fromJson(json['user']),
        token: json['token'] ?? "",
      );

  Map<String, dynamic> toJson() {
    return {
      'user': userLogin,
      'token': token,
    };
  }
}

class userLoginModel extends UserLogin {
  const userLoginModel(
      {required super.id,
      required super.username,
      required super.phone,
      required super.timestamp,
      required super.points,
      required super.imagePath,
      required super.userType});

  factory userLoginModel.fromJson(Map<String, dynamic> json) => userLoginModel(
        id: json['id'],
        username: json['username'] ?? "",
        phone: json['phone'] ?? "",
        timestamp: json['timestamp'] ?? "",
        points: json['points'] ?? "",
        imagePath: json['image_path'] ?? "",
        userType: json['user_type'] ?? "",
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'phone': phone,
      'timestamp': timestamp,
      'points': points,
      'image_path': imagePath,
      'user_type': userType,
    };
  }
}


