import 'package:aqar/3qar/sign_up/data/repository/sign_up_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/sign_up_request_model.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;
  SignUpCubit(this._signUpRepository) : super(SignUpState.initial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();

  String userType = 'buyer';
  void setUserType(String type) {
    userType = type;
  }

  Future<void> signUp() async {
    emit(const SignUpState.loading());

    final request = SignUpRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phone: phoneController.text.trim(),
    );

    final result = await _signUpRepository.signUp(request);

    result.when(
      success: (user) {
        print( 'Success ✅ Sign Up User ID: ${user.id}');
        emit(SignUpState.success(user));
      },
      failure: (error) {
        print('Error ❌ Sign Up: $error');
        emit(SignUpState.error(error: error));
      },
    );
  }
}

  // void signUp() async {
  //   emit(SignUpState.loading());

  //   final userModel = UserModel(
  //     firstName: firstNameController.text.trim(),
  //     lastName: lastNameController.text.trim(),
  //     phone: phoneController.text.trim(),
  //     image: '',
  //     userType: userType,
  //     password: passwordController.text.trim(),
  //     email: emailController.text.trim(),
  //   );

  //   final result = await _signUpRepository.signUp(userModel);

  //   result.when(success: (id) {
  //     emit(SignUpState.success(id!));
  //   }, failure: (error) {
  //     print('Error ❌ Sign Up: $error');
  //     emit(SignUpState.error(error: error));
  //   });
  // }
