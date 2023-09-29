import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
final UserLogin userLogin;
  final String token;

  const UserInfo({
    required this.userLogin,
    required this.token,
  });

  @override
  List<Object?> get props => [userLogin, token];
}
class UserLogin extends Equatable {
  final int id;
  final String username;
  final int points;
  final int phone;
  final String imagePath;
  final String timestamp;
  final String userType;


  const UserLogin({
    required this.id,
    required this.username,
    required this.points,
    required this.phone,
    required this.imagePath,
    required this.timestamp,
    required this.userType,
  });

  @override
  List<Object?> get props => [id, username,points, phone,imagePath, timestamp,userType];
}



// {
//     "data": {
//         "user": {
//             "id": 292,
//             "username": "user1",
//             "points": 0,
//             "phone": "954339974",
//             "image_path": "",
//             "timestamp": "2023-08-18 09:11:24.337788",
//             "user_type": ""
//         },
//         "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjkyLCJ1c2VybmFtZSI6InVzZXIxIiwibG9naW4iOiI5NTQzMzk5NzQiLCJ0aW1lc3RhbXAiOiIyMDIzLTA4LTE4IDA5OjExOjI0LjMzNzc4OCJ9.cyKFomX_HsCuRNOMDl_4wPgojRdPRg6RWE4_CsBsTNk"
//     }
// }



