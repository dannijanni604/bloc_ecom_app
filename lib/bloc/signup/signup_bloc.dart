import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repository/auth/signup_repository.dart';
import '../../utils/enums.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupRepository signUpRepository = SignupRepository();

  SignupBloc() : super(const SignupState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SubmitSignup>(_signUpApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _signUpApi(SubmitSignup event, Emitter<SignupState> emit) async {


    emit(state.copyWith(apiStatus: ApiStatus.loading));
    Map<String, String> payload = {"email": state.email, "password": state.password};

    try {
      final value = await signUpRepository.signUpApi(payload);

      if (!isClosed) {
        emit(state.copyWith(message: value.token.toString(), apiStatus: ApiStatus.success));
      }
    } catch (error) {
      if (!isClosed) {
        emit(state.copyWith(message: error.toString(), apiStatus: ApiStatus.error));
      }
    }

    // emit(state.copyWith(apiStatus: ApiStatus.loading));
    // // Map payload ={"email": "eve.holt@reqres.in", "password": "pistol"};
    // Map payload = {"email": state.email, "password": state.password};
    //
    // signUpRepository
    //     .signUpApi(payload);
    // emit(state.copyWith(message:' value.token.toString()', apiStatus: ApiStatus.error));

    //     .then(
    //       (value) {
    //         if (!isClosed) {
    //           emit(state.copyWith(message: value.token.toString(), apiStatus: ApiStatus.success));
    //         }
    //       },
    //     )
    //     .onError(
    //   (error, stackTrace) {
    //     if (!isClosed) {
    //       emit(state.copyWith(message: error.toString(), apiStatus: ApiStatus.error));
    //     }
    //   },
    // );
  }
}
