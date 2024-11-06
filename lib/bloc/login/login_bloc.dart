import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../../utils/utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    Map data = {'email': state.email, 'password': state.password};
    try {
      final response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: data);
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(state.copyWith(
            apiStatus: ApiStatus.success, message: 'Login success'));
      } else {
        emit(state.copyWith(
            apiStatus: ApiStatus.error, message: responseData['error']));
      }
    } catch (e) {
      emit(state.copyWith(apiStatus: ApiStatus.error, message: e.toString()));
    }
  }
}
