import 'package:aqar/3qar/login/data/models/login_request_body.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/server_result.dart';

import '../../../../core/constants/constants.dart';
import '../../../sign_up/data/model/user_model.dart';

class LoginRepository {
  final RegisterService _registerService;

  LoginRepository(this._registerService);

  Future<ServerResult<UserModel>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _registerService.login(loginRequestBody);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  
  Future<ServerResult<UserModel>> signInWithGoogle() async {
    try {
      final user = await _registerService.signInWithGoogle();
      return Success(user);
    } catch (e) {
      return Failure(Constants.handleError(e));
    }
  }

  Future<ServerResult<UserModel>> signInWithFacebook() async {
    try {
      final user = await _registerService.signInWithFacebook();
      return Success(user);
    } catch (e) {
      return Failure(Constants.handleError(e));
    }
  }

  Future<ServerResult<void>> sendPasswordResetEmail(String email) async {
    try {
      final result = await _registerService.sendPasswordResetEmail(email);
      return result;
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
