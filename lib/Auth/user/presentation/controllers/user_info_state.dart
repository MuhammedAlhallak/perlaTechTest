import 'package:perlatech/core/utils/enum.dart';

class UserInfoState {
  final LoggedState isLogged;
  final String logOutMassage;
  UserInfoState(
      {this.isLogged = LoggedState.unLogged, this.logOutMassage = ''});

  UserInfoState copyWith({LoggedState? isLogged, String? logOutMassage}) {
    return UserInfoState(
        isLogged: isLogged ?? LoggedState.unLogged,
        logOutMassage: logOutMassage ?? this.logOutMassage);
  }
}
