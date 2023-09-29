import 'package:equatable/equatable.dart';

class RegisterData extends Equatable {
  final User user;
  final String token;

  const RegisterData({
    required this.user,
    required this.token,
  });

  @override
  List<Object?> get props => [user, token];
}

class User extends Equatable {
  final int id;
  final String username;
  final String phone;
  final String timestamp;

  const User({
    required this.id,
    required this.username,
    required this.phone,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, username,phone, timestamp];
}


// {
//     "data": {
//         "user": {
//             "id": 294,
//             "username": "user1",
//             "phone": "95433997",
//             "timestamp": "2023-08-18 09:02:25.997490"
//         },
//         "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mjk0LCJ1c2VybmFtZSI6InVzZXIxIiwicGFzc3dvcmQiOiJRd2VAMTIzQCIsImxvZ2luIjoiOTU0MzM5OTciLCJ0aW1lc3RhbXAiOiIyMDIzLTA4LTE4IDA5OjAyOjI1Ljk5NzQ5MCJ9.oA5hcv5Wz7yD-g7jXqKPI2CjioPbtChcRJ0vhN0rd2U"
//     }
// }