import 'package:aqar/3qar/buyer_app/buyer_navigation_menu/controller/buyer_navigation_cubit.dart';
import 'package:aqar/3qar/buyer_app/chat/cubit/chat_list_cubit.dart';
import 'package:aqar/3qar/buyer_app/chat/data/network/chat_service.dart';
import 'package:aqar/3qar/buyer_app/chat/data/repository/chat_list_repository.dart';
import 'package:aqar/3qar/buyer_app/conversation/cubit/message_cubit.dart';
import 'package:aqar/3qar/buyer_app/conversation/data/network/message_service.dart';
import 'package:aqar/3qar/buyer_app/conversation/data/repository/message_repository.dart';
import 'package:aqar/3qar/buyer_app/customer_service/cubit/customer_service_cubit.dart';
import 'package:aqar/3qar/buyer_app/customer_service/data/network/customer_service.dart';
import 'package:aqar/3qar/buyer_app/customer_service/data/repository/customer_service_repository.dart';
import 'package:aqar/3qar/buyer_app/favorite/controller.dart/cubit/favorites_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/controller/categories/cubit/categories_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/controller/home/home_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/controller/search/bloc/search_bloc.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service_impl.dart';
import 'package:aqar/3qar/buyer_app/home/data/repository/properties_repository.dart';
import 'package:aqar/3qar/buyer_app/home/data/repository/units_repository.dart';
import 'package:aqar/3qar/buyer_app/profile/controller/profile/profile_cubit.dart';
import 'package:aqar/3qar/buyer_app/profile/controller/theme/cubit/theme_cubit.dart';
import 'package:aqar/3qar/buyer_app/profile/data/network/profile_service.dart';
import 'package:aqar/3qar/buyer_app/profile/data/repository/profile_repository.dart';
import 'package:aqar/3qar/buyer_app/property_rating/controller/cubit/rating_cubit.dart';
import 'package:aqar/3qar/buyer_app/property_rating/data/network/rating_service.dart';
import 'package:aqar/3qar/buyer_app/property_rating/data/repository/rating_repository.dart';
import 'package:aqar/3qar/login/controller/login_cubit.dart';
import 'package:aqar/3qar/login/data/repository/login_repository.dart';
import 'package:aqar/3qar/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:aqar/3qar/sign_up/data/repository/sign_up_repository.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/register/register_service_impl.dart';
import 'package:get_it/get_it.dart';

import '../../3qar/buyer_app/chat/data/network/chat_service_impl.dart';
import '../../3qar/buyer_app/conversation/data/network/message_service_impl.dart';
import '../../3qar/buyer_app/favorite/data/favorites_repository.dart';
import '../../3qar/buyer_app/favorite/data/network/favorite_service.dart';
import '../../3qar/buyer_app/favorite/data/network/favorite_service_impl.dart';
import '../../3qar/buyer_app/profile/data/network/profile_service_impl.dart';
import '../../3qar/buyer_app/property_rating/data/network/rating_service_impl.dart';
import '../network/users/user_service.dart';
import '../network/users/user_service_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  /// REGISTER SERVICE
  getIt.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());

  /// USER SERVICE
  getIt.registerLazySingleton<UserService>(() => UserServiceImpl());

  getIt.registerLazySingleton<PropertyService>(() => PropertyServiceImpl());

  getIt.registerLazySingleton<RatingService>(() => RatingServiceImpl());

  getIt.registerLazySingleton<FavoriteService>(() => FavoriteServiceImpl());

  getIt.registerLazySingleton<ProfileService>(() => ProfileServiceImpl());

  getIt.registerLazySingleton<ChatService>(() => ChatServiceImpl());

  getIt.registerLazySingleton<MessageService>(() => MessageServiceImpl());

  getIt.registerLazySingleton<CustomerService>(() => CustomerService());

  /// LOGIN
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  /// SIGN UP
  getIt
      .registerLazySingleton<SignUpRepository>(() => SignUpRepository(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  /// BUYER NAVIGATION CUBIT
  getIt.registerFactory<BuyerNavigationCubit>(() => BuyerNavigationCubit());

  /// PROPERTY
  getIt.registerLazySingleton<PropertiesRepository>(
      () => PropertiesRepository(getIt()));
  getIt.registerLazySingleton<UnitsRepository>(() => UnitsRepository(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt(), getIt()));

  /// RATINGS
  getIt
      .registerLazySingleton<RatingRepository>(() => RatingRepository(getIt()));
  getIt.registerFactory<RatingCubit>(() => RatingCubit(getIt()));

  /// FAVORITES
  getIt.registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepository(getIt()));
  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt()));

  /// PROFILES
  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(getIt()));
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));

  /// CHAT
  getIt.registerLazySingleton<ChatListRepository>(
      () => ChatListRepository(getIt()));
  getIt.registerLazySingleton<ChatListCubit>(() => ChatListCubit(getIt()));

  /// Conversation
  getIt.registerLazySingleton<MessageRepository>(
      () => MessageRepository(getIt()));
  getIt.registerFactory<MessageCubit>(() => MessageCubit(getIt()));

  getIt.registerLazySingleton<SearchBloc>(() => SearchBloc(getIt()));
  getIt.registerLazySingleton<CategoriesCubit>(() => CategoriesCubit(getIt()));
  getIt.registerFactory<ThemeCubit>(() => ThemeCubit());

  /// Customer Service
  getIt.registerLazySingleton<CustomerServiceRepository>(
      () => CustomerServiceRepository(getIt(), getIt()));

  getIt.registerFactory<CustomerServiceCubit>(
      () => CustomerServiceCubit(getIt()));
}
