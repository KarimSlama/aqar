import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/local_storage/local_storage.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/popups/loaders.dart';
import '../../../core/constants/constants.dart';
import '../controller/cubit/sign_up_cubit.dart';
import '../controller/cubit/sign_up_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) => state.maybeWhen(
        loading: () => CircularProgressIndicator(),
        success: (user) async {
          await SharedPreference.setSecureString(Constants.USER_KEY, user.id);
          isLoggedUser = true;
          if (context.mounted) {
            Loaders.successSnackBar(
                context: context,
                title: AqarString.congratulations,
                message: AqarString.youJoinedAqarSuccessfully);
            context.pushNamedAndRemoveUntil(
              Routes.buyerNavigationMenu,
              predicate: (route) => false,
            );
          }
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
