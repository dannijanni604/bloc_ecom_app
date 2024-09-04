part of 'signup_bloc.dart';


abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends SignupEvent {
  const EmailChanged({required this.email});
  final String email;


  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends SignupEvent{}

class PasswordChanged extends SignupEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class SubmitSignup extends SignupEvent {}
