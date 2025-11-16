import 'package:aqar/3qar/login/controller/login_state.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/local_storage/local_storage.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/popups/loaders.dart';
import '../../../core/constants/constants.dart';
import '../controller/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) => state.maybeWhen(
        loading: () => CircularProgressIndicator(),
        success: (user) async {
          await SharedPreference.setSecureString(Constants.USER_KEY, user.id);
          isLoggedUser = true;
          if (context.mounted) {
            Loaders.successSnackBar(
                context: context,
                title: AqarString.congratulations,
                message: AqarString.youLoggedInSuccessfully);
            context.pushNamedAndRemoveUntil(
              Routes.buyerNavigationMenu,
              predicate: (route) => false,
            );
          }
          return null;
        },
        resetPasswordSent: () {
          if (context.mounted) {
            Loaders.successSnackBar(
                context: context, title: AqarString.passwordResetEmailSent);
          }
          context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (route) => false);
          return null;
        },
        error: (error) {
          if (context.mounted) {
            Loaders.errorSnackBar(
                context: context,
                title: AqarString.error,
                message: error.toString());
          }
          return null;
        },
        orElse: () => SizedBox.shrink(),
      ),
      child: SizedBox.shrink(),
    );
  }
}
