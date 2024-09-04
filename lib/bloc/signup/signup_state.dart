part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState({
    this.email='',
    this.password='',
    this.apiStatus=ApiStatus.initial,
    this.message='',

  });

  final String email;
  final String password;
  final ApiStatus apiStatus;
  final String message;


  SignupState copyWith({
    String? email,
    String? password,
    ApiStatus? apiStatus,
    String? message

  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      apiStatus: apiStatus?? this.apiStatus,
        message: message?? this.message

    );
  }

  @override
  List<Object> get props =>[email,password,apiStatus,message];
}