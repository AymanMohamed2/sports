// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginWithGoogle() {
    emit(LoginLoading());

    emit(LoginSuccess());
  }

  void loginWithOTP(String otp) {
    emit(LoginLoading());

    emit(LoginSuccess());
  }
}
