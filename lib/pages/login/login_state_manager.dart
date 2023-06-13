import 'package:MyCombinationsApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

import '../../services/auth_service.dart';

class LoginStateManager {
  final _authService = GetIt.instance.get<AuthService>();
  String _email = 'string';
  String _password = 'string';

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  void login() {
    validate({
      'Email': _email,
      'Password': _password,
    });

    _authService.login(_email, _password);
  }
}
