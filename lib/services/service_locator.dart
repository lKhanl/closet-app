import 'package:MyCombinationsApp/pages/bottom/bottom_state_manager.dart';
import 'package:MyCombinationsApp/pages/combine/combine_state_manager.dart';
import 'package:MyCombinationsApp/pages/home/user_state_manager.dart';
import 'package:MyCombinationsApp/pages/login/login_state_manager.dart';
import 'package:MyCombinationsApp/pages/register/register_state_manager.dart';
import 'package:MyCombinationsApp/pages/shoes/shoes_state_manager.dart';
import 'package:MyCombinationsApp/pages/top/top_state_manager.dart';
import 'package:MyCombinationsApp/services/auth_service.dart';
import 'package:MyCombinationsApp/services/bottom_service.dart';
import 'package:MyCombinationsApp/services/combine_service.dart';
import 'package:MyCombinationsApp/services/shoes_service.dart';
import 'package:MyCombinationsApp/services/top_service.dart';
import 'package:MyCombinationsApp/services/user_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // state management layer
  getIt.registerLazySingleton<RegisterStateManager>(
      () => RegisterStateManager());
  getIt.registerLazySingleton<LoginStateManager>(() => LoginStateManager());
  getIt.registerLazySingleton<UserStateManager>(() => UserStateManager());
  getIt.registerLazySingleton<TopStateManager>(() => TopStateManager());
  getIt.registerLazySingleton<BottomStateManager>(() => BottomStateManager());
  getIt.registerLazySingleton<ShoesStateManager>(() => ShoesStateManager());
  getIt.registerLazySingleton<CombineStateManager>(() => CombineStateManager());

  // service layer
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<UserService>(() => UserService());
  getIt.registerLazySingleton<TopService>(() => TopService());
  getIt.registerLazySingleton<ShoesService>(() => ShoesService());
  getIt.registerLazySingleton<BottomService>(() => BottomService());
  getIt.registerLazySingleton<CombineService>(() => CombineService());
}
