abstract class RegisterEvent {}

class RegisterFullNameChangedEvent extends RegisterEvent {
  RegisterFullNameChangedEvent({required this.fullName});
  final String fullName;
}

class RegisterphoneChangedEvent extends RegisterEvent {
  RegisterphoneChangedEvent({required this.phone});
  final String phone;
}

class RegisterPasswordChangedEvent extends RegisterEvent {
  RegisterPasswordChangedEvent({required this.password});
  final String password;
}

class RegisterConfirmPasswordChangedEvent extends RegisterEvent {
  RegisterConfirmPasswordChangedEvent({required this.confirmPassword});
  final String confirmPassword;
}

class RegisterSubmittedEvent extends RegisterEvent {}
