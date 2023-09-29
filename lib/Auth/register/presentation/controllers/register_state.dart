
import '../../../../core/utils/enum.dart';

class RegisterState {
  final String fullName;
  bool get isValidfullName => fullName.length > 3;

  final String phone;
  bool get isValidphone => phone.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final String confirmPassword;
  bool get isValidconfirmPassword => confirmPassword == password;
  // final FormSubmissionStatus formStatus;
  final RequestState registerFormState;
  final String registerMassage;

  RegisterState(
      {this.fullName = '',
      this.phone = '',
      this.password = '',
      this.confirmPassword = '',
      this.registerFormState = RequestState.inisial,
      this.registerMassage = ''
      // this.formStatus = const InitialFormStatus()

      });

  RegisterState copyWith({
    String? fullName,
    String? phone,
    String? password,
    String? confirmPassword,
    RequestState? registerFormState,
    String? registerMassage,
  }) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      registerFormState: registerFormState ?? this.registerFormState,
      registerMassage: registerMassage ?? this.registerMassage,
    );
  }
}
