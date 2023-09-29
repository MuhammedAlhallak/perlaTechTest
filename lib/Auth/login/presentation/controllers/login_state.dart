

import '../../../../core/utils/enum.dart';

class LoginState {
  final String username;
  bool get isValidUsername => username.length > 3;
  final String password;
  bool get isValidPassword => password.length > 6;
  // final FormSubmissionStatus formStatus;
  final RequestState loginFormState;
  final String loginMassage;

  LoginState(
      {this.username = '',
      this.password = '',
      this.loginFormState = RequestState.inisial,
      this.loginMassage = ''
      // this.formStatus = const InitialFormStatus()

      });

  LoginState copyWith({
    String? username,
    String? password,
    RequestState? loginFormState,
    String? loginMassage,
  }) {
  
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginFormState: loginFormState ?? this.loginFormState,
      loginMassage: loginMassage ?? this.loginMassage,
    );
  }
}
