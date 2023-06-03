import 'package:ClosetApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

import '../../services/auth_service.dart';

class RegisterStateManager {
  final _service = GetIt.instance.get<AuthService>();
  String _fullName = '';
  String _email = '';
  String _password = '';
  String _passwordConfirmation = '';

  void setUsername(String username) {
    _email = username;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setFullName(String fullName) {
    _fullName = fullName;
  }

  void setPasswordConfirmation(String passwordConfirmation) {
    _passwordConfirmation = passwordConfirmation;
  }

  void register() {
    validate({
      'Full Name': _fullName,
      'Email': _email,
      'Password': _password,
      'Password Confirmation': _passwordConfirmation,
    });

    final success =
        _service.register(_fullName, _email, _password, _passwordConfirmation);
    if (success) {
      print(_fullName);
    }
  }
}
