import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/server_result.dart';


import '../../../../core/constants/constants.dart';
import '../model/sign_up_request_model.dart';
import '../model/user_model.dart';

class SignUpRepository {
  final RegisterService _registerService;

  const SignUpRepository(this._registerService);

  Future<ServerResult<UserModel>> signUp(SignUpRequest request) async {
    try {
      final user = await _registerService.signUp(request);
      return Success(user);
    } catch (e) {
      return Failure(Constants.handleError(e));
    }
  }

}
