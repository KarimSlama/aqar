import 'dart:async';

import 'package:aqar/3qar/login/data/models/login_request_body.dart';
import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/server_result.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../3qar/sign_up/data/model/sign_up_request_model.dart';

class RegisterServiceImpl implements RegisterService {
  final supabase = Supabase.instance.client;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
      clientId:
          '475893240869-vv9qqvlfp3gr50vcdtlg3ju6ju8ngtr0.apps.googleusercontent.com',
      serverClientId:
          '475893240869-vv9qqvlfp3gr50vcdtlg3ju6ju8ngtr0.apps.googleusercontent.com',
      signInOption: SignInOption.standard);

  @override
  Future<UserModel> login(LoginRequestBody loginRequestBody) async {
    final authResponse = await supabase.auth.signInWithPassword(
      email: loginRequestBody.email,
      password: loginRequestBody.password,
    );

    if (authResponse.user == null) {
      throw Exception('Failed to login');
    }

    // Fetch user profile
    final profileData = await supabase
        .from('profiles')
        .select()
        .eq('id', authResponse.user!.id)
        .single();

    return UserModel.fromJson(profileData);
  }

  @override
  Future<UserModel> signUp(SignUpRequest request) async {
    // 1. Sign up with Supabase Auth
    final authResponse = await supabase.auth.signUp(
      email: request.email,
      password: request.password,
    );

    if (authResponse.user == null) {
      throw Exception('Failed to create user');
    }

    // 2. Create profile in profiles table
    await supabase.from('profiles').insert({
      'id': authResponse.user!.id,
      'email': request.email,
      'first_name': request.firstName,
      'last_name': request.lastName,
      'phone': request.phone,
      'user_type': request.userType,
    });

    // 3. Fetch the created profile
    final profileData = await supabase
        .from('profiles')
        .select()
        .eq('id', authResponse.user!.id)
        .single();

    return UserModel.fromJson(profileData);
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      // استخدم Supabase OAuth مباشرة - بدون GoogleSignIn package
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'io.supabase.flutter://login-callback',
        authScreenLaunchMode: LaunchMode.inAppWebView,
      );

      // استنى لحد ما ياكمل الـlogin
      final completer = Completer<User>();
      final subscription = supabase.auth.onAuthStateChange.listen((data) {
        final user = data.session?.user;
        if (user != null && !completer.isCompleted) {
          completer.complete(user);
        }
      });

      final user = await completer.future.timeout(Duration(seconds: 30));
      await subscription.cancel();

      print('✅ Google OAuth successful: ${user.email}');

      // Create/Update profile
      await supabase.from('profiles').upsert({
        'id': user.id,
        'email': user.email,
        'first_name': user.userMetadata?['full_name']?.split(' ').first ?? '',
        'last_name':
            user.userMetadata?['full_name']?.split(' ').skip(1).join(' ') ?? '',
        'image': user.userMetadata?['avatar_url'],
        'user_type': 'buyer',
      }, onConflict: 'id');

      // Fetch profile
      final profileData =
          await supabase.from('profiles').select().eq('id', user.id).single();

      return UserModel.fromJson(profileData);
    } catch (e) {
      print('❌ Google OAuth Error: $e');
      rethrow;
    }
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    await supabase.auth.signInWithOAuth(
      OAuthProvider.facebook,
      redirectTo: 'https://ktbufzscykarhvrrlwzi.supabase.co/auth/v1/callback',
      scopes: 'email,public_profile',
      authScreenLaunchMode: LaunchMode.inAppWebView,
    );

    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('Failed to sign in with Facebook');
    }

    await supabase.from('profiles').upsert({
      'id': user.id,
      'email': user.email,
      'first_name': user.userMetadata?['first_name'] ?? '',
      'last_name': user.userMetadata?['last_name'] ?? '',
      'image': user.userMetadata?['avatar_url'] ?? '',
      'user_type': 'buyer',
    }, onConflict: 'id');

    final profileData =
        await supabase.from('profiles').select().eq('id', user.id).single();

    return UserModel.fromJson(profileData);
  }

  // @override
  // Future<String?> signInWithFacebook() async {
  //   await supabase.auth.signInWithOAuth(
  //     OAuthProvider.facebook,
  //     redirectTo: 'https://ktbufzscykarhvrrlwzi.supabase.co/auth/v1/callback',
  //     scopes: 'email,public_profile',
  //     authScreenLaunchMode: LaunchMode.inAppWebView,
  //   );

  //   final user = supabase.auth.currentUser;
  //   if (user != null) {
  //     await supabase.from('profiles').upsert({
  //       'id': user.id,
  //       'email': user.email,
  //       'first_name': user.userMetadata?['first_name'] ?? '',
  //       'last_name': user.userMetadata?['last_name'] ?? '',
  //       'image': user.userMetadata?['avatar_url'] ?? '',
  //       'user_type': 'buyer',
  //     }, onConflict: 'id');

  //     return user.id;
  //   }
  //   return null;
  // }

  @override
  Future<ServerResult<void>> sendPasswordResetEmail(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
