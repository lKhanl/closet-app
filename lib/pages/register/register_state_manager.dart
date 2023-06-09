import 'package:MyCombinationsApp/utils/validator.dart';
import 'package:get_it/get_it.dart';

import '../../services/auth_service.dart';

class RegisterStateManager {
  final _service = GetIt.instance.get<AuthService>();
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';

  void setUsername(String username) {
    _email = username;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setFirstName(String firstName) {
    _firstName = firstName;
  }

  void setLastName(String lastName) {
    _lastName = lastName;
  }

  void register() {
    validate({
      'Full Name': _firstName,
      'Last Name': _lastName,
      'Email': _email,
      'Password': _password
    });
    _service.register(_firstName, _lastName, _email, _password);
  }
}
