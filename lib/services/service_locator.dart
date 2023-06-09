import 'package:MyCombinationsApp/pages/login/login_state_manager.dart';
import 'package:MyCombinationsApp/pages/register/register_state_manager.dart';
import 'package:MyCombinationsApp/services/auth_service.dart';
import 'package:MyCombinationsApp/services/user_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // state management layer
  getIt.registerLazySingleton<RegisterStateManager>(
      () => RegisterStateManager());
  getIt.registerLazySingleton<LoginStateManager>(() => LoginStateManager());

  // service layer
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<UserService>(() => UserService());
}