import 'package:aqar/3qar/login/data/models/login_request_body.dart';

import '../../../3qar/sign_up/data/model/sign_up_request_model.dart';
import '../../../3qar/sign_up/data/model/user_model.dart';
import '../server_result.dart';

abstract class RegisterService {
 Future<UserModel> signUp(SignUpRequest request);

  Future<UserModel> login(LoginRequestBody loginRequestBody);

  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();

  // Forgot Password
  Future<ServerResult<void>> sendPasswordResetEmail(String email);
}
