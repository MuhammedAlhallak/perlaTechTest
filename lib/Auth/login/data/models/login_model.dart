
import '../../domain/entities/login_entitnes.dart';

class LoginDataModel extends LoginData {
  const LoginDataModel({ required super.token, required super.userLogin});

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      LoginDataModel(
        userLogin: userLoginModel.fromJson(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() {
    return {
      "token": token,
    };
  }
}


class userLoginModel extends UserLogin {
  const userLoginModel({required super.id, required super.username,required super.phone,required super.timestamp, required super.points, required super.imagePath, required super.userType});

  factory userLoginModel.fromJson(Map<String, dynamic> json) =>
      userLoginModel(
        id: json['id'],
        username: json['username'],
        phone: json['phone'],
        timestamp: json['timestamp'],
        points: json['points'],
        imagePath:json['image_path'],
        userType: json['user_type'],
      );


}








