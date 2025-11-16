import 'package:aqar/3qar/login/controller/login_state.dart';
import 'package:aqar/3qar/login/data/models/login_request_body.dart';
import 'package:aqar/3qar/login/data/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  LoginCubit(this.loginRepository) : super(const LoginState.initial());

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    emit(LoginState.loading());

    final result = await loginRepository.login(LoginRequestBody(
        email: emailController.text, password: passwordController.text));

    result.when(success: (user) {
      emit(LoginState.success(user));
    }, failure: (error) {
      emit(LoginState.error(error: error));
    });
  }

  Future<void> signInWithGoogle() async {
    emit(LoginState.loading());
    final result = await loginRepository.signInWithGoogle();
    result.when(success: (user) {
      print('Success Google Login ID: ${user.id}');
      emit(LoginState.success(user));
    }, failure: (error) {
      print('Error ❌ Google Login: $error');
      emit(LoginState.error(error: error));
    });
  }

  Future<void> signInWithFacebook() async {
    emit(LoginState.loading());
    final result = await loginRepository.signInWithFacebook();
    result.when(success: (user) {
      print('Success ✅Facebook Login ID: ${user.id}');
      emit(LoginState.success(user));
    }, failure: (error) {
      print('Error ❌ Facebook Login: $error');
      emit(LoginState.error(error: error));
    });
  }

  Future<void> sendPasswordResetEmail(String email) async {
    emit(LoginState.loading());
    final result = await loginRepository.sendPasswordResetEmail(email);
    result.when(
      success: (_) => emit(const LoginState.resetPasswordSent()),
      failure: (error) => emit(LoginState.error(error: error)),
    );
  }
}
