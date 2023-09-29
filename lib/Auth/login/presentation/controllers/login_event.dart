abstract class LoginEvent {}

class LoginUsernameChangedEvent extends LoginEvent {
  LoginUsernameChangedEvent({required this.username});
  final String username;
}

class LoginPasswordChangedEvent extends LoginEvent {
  LoginPasswordChangedEvent({required this.password});
  final String password;
}

class LoginSubmittedEvent extends LoginEvent {}
