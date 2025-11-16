import 'package:aqar/aqar_app.dart';
import 'package:aqar/core/local_storage/local_storage.dart';
import 'package:aqar/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/constants.dart';
import 'core/service_locator/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  setupServiceLocator();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  await checkIfUserLoggedIn();

  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.env['SENTRY_DSN'] ?? '';
    },
    appRunner: () =>
        runApp(SentryWidget(child: AqarApp(appRouter: AppRouter()))),
  );
}

checkIfUserLoggedIn() async {
  final userKey = await SharedPreference.getSecureString(Constants.USER_KEY);
  if (userKey != null && userKey.isNotEmpty) {
    isLoggedUser = true;
  } else {
    isLoggedUser = false;
  }
}
