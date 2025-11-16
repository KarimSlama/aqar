import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/user_model.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(UserModel user) = Success;
  const factory SignUpState.error({required String error}) = Error;
}
