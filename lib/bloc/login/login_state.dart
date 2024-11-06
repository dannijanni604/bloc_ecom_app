part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.apiStatus = ApiStatus.initial,
    this.message = '',
  });

  final String email;
  final String password;
  final ApiStatus apiStatus;
  final String message;

  LoginState copyWith(
      {String? email,
      String? password,
      ApiStatus? apiStatus,
      String? message}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        apiStatus: apiStatus ?? this.apiStatus,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [email, password, apiStatus, message];
}
