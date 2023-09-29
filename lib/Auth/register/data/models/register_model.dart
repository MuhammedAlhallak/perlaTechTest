
import '../../domain/entities/register_entitnes.dart';

class RegisterDataModel extends RegisterData {
  const RegisterDataModel({required super.user, required super.token});

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        user: UserModel.fromJson(json['user']),
        token: json['token'],
      );
}


class UserModel extends User {
  const UserModel({required super.id, required super.username,required super.phone,required super.timestamp});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        id: json['id'],
        username: json['username'],
        phone: json['phone'],
        timestamp: json['timestamp'],
      );
}








