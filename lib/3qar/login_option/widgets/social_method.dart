import 'package:aqar/3qar/login/controller/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/constants/aqar_sizes.dart';

class SocialMethod extends StatelessWidget {
  const SocialMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Row(
      spacing: AqarSizes.defaultSpace,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () async {
              await loginCubit.signInWithFacebook();
            },
            icon: Icon(Iconsax.facebook, size: 35.sp)),
        IconButton(
          onPressed: () async {
            await loginCubit.signInWithGoogle();
          },
          icon: Icon(Iconsax.google_copy, size: 35.sp),
        ),
      ],
    );
  }
}
