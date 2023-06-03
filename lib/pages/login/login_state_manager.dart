import 'package:ClosetApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

import '../../services/auth_service.dart';

class LoginStateManager {
  final _authService = GetIt.instance.get<AuthService>();
  String _email = '';
  String _password = '';

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

    final success = _authService.login(_email, _password);
    print(success);
  }
}
