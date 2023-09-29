
import 'package:perlatech/Auth/user/domain/entities/user_info_entitnes.dart';

class UserInfoModel extends UserInfo {
 const UserInfoModel({ required super.token, required super.userLogin});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      UserInfoModel(
        userLogin: userLoginModel.fromJson(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() {
    return {
      'user': userLogin,
      'token': token,
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




// class DataModel extends Data {
//   const DataModel(
//       {required super.id,
//       required super.username,
//       required super.language,
//       required super.accessToken,
//       required super.jobPositions});
//   factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
//       id: json['id'],
//       username: json['username'],
//       language: json['language'],
//       accessToken: json['access_token'],
//       jobPositions: List<JobPositions>.from(
//           json['job_positions'].map((x) => JobPositionsModel.fromJson(x))));

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'username': username,
//       'language': language,
//       'access_token': accessToken,
//       'job_positions': jobPositions,
//     };
//   }
// }

// class JobPositionsModel extends JobPositions {
//   const JobPositionsModel(
//       {required super.id, required super.name, super.description});

//   factory JobPositionsModel.fromJson(Map<String, dynamic> json) =>
//       JobPositionsModel(
//           id: json['id'],
//           name: json['name'],
//           description: json['description'] ?? "");

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'description': description,
//     };
//   }
// }
