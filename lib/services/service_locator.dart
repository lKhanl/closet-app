import 'package:ClosetApp/pages/login/login_state_manager.dart';
import 'package:ClosetApp/pages/register/register_state_manager.dart';
import 'package:ClosetApp/services/auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // state management layer
  getIt.registerLazySingleton<RegisterStateManager>(() => RegisterStateManager());
  getIt.registerLazySingleton<LoginStateManager>(() => LoginStateManager());

  // service layer
  getIt.registerLazySingleton<AuthService>(() => AuthService());
}