import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(UserModel user) = Success;
  const factory LoginState.resetPasswordSent() = ResetPasswordSent;
  const factory LoginState.error({required String error}) = Error;
}
